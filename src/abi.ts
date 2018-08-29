import {
  SerializeHelper,
  SerializePoint,
  VariableDeclaration,
  VarialbeKind,
  NodeUtil
} from "./serialize";

import {
  Type,
} from "./types";

import {
  ElementKind,
  Element,
  ClassPrototype,
  FunctionPrototype,
  Program,
  VariableLikeElement
} from "./program";

import {
  DecoratorKind,
  DecoratorNode,
  SignatureNode,
  FunctionDeclaration,
  DeclarationStatement,
  FieldDeclaration,
  NodeKind,
  ParameterNode,
  Expression,
  VariableLikeDeclarationStatement,
  StringLiteralExpression,
  ClassDeclaration,
  MethodDeclaration
} from "./ast";

class Struct {

  name: string;
  base: string;
  fields: Array<Object> = new Array<Object>();
}

class AbiTypeAlias {
  new_type_name: string;
  type: string;

  constructor(newTypeName: string, wasmType: string) {
    this.new_type_name = newTypeName;
    this.type = wasmType;
  }
}

class Action {

  name: string;
  type: string;
  ricardian_contract: string = "";

  constructor(name: string, type: string) {
    this.name = name;
    this.type = type;
  }
}

export class AbiHelper {

  static abiTypeLookup: Map<string, string> = new Map([
    ["i8", "int8"],
    ["i16", "int16"],
    ["i32", "int32"],
    ["i64", "int64"],
    ["isize", ""],
    ["u8", "uint8"],
    ["u16", "uint16"],
    ["u32", "uint32"],
    ["u64", "uint64"],
    ["usize", "usize"],
    ["bool", "uint8"], // eos not support the bool
    ["f32", "f32"],
    ["f64", "f64"],
    ["boolean", "uint8"], // eos not suppot the bool
    ["account_name", "name"],
    ["permission_name", "name"],
    ["action_name", "name"],
    ["weight_type", "uint16"],
    ["Asset", "asset"]
  ]);
}

class Table {
  name: string;
  type: string;
  index_type: string = "i64";
  keys_names: string[] = ["currency"];
  keys_types: string[] = ["uint64"];

  constructor(name: string, type: string, indexType:string = "i64") {
    this.name = name;
    this.type = type;
    this.index_type = indexType; 
  }
}

export class Abi {

  abiInfo: {
    version: string,
    types: Array<AbiTypeAlias>,
    structs: Array<Struct>,
    actions: Array<Action>,
    tables: Array<Table>
  };

  dispatch: string;

  program: Program;

  abiTypeLookup: Map<string, string> = new Map();

  typeAliasSet: Set<string> = new Set<string>();

  structsLookup: Map<string, Struct> = new Map();

  elementLookup: Map<string, Element> = new Map();

  fileSerializeLookup: Map<string, Array<SerializePoint>> = new Map<string, Array<SerializePoint>>();

  constructor(program: Program) {

    this.program = program;

    this.abiInfo = {
      version: "ultraio:1.0",
      types: new Array<AbiTypeAlias>(),
      structs: new Array<Struct>(),
      actions: new Array<Action>(),
      tables: new Array<Table>()
    };

    this.abiTypeLookup = AbiHelper.abiTypeLookup;
  }

  /**
  *  Add abi struct for abi info.
  */
  toAbiStruct(methodName: string, signature: SignatureNode): Struct {

    var struct = new Struct();
    struct.name = methodName;
    struct.base = "";

    var types = signature.parameters;
    if (types) {
      for (let type of types) {
        let typeKind = type.type.range.toString();
        this.addAbiTypeAlias(typeKind);
        struct.fields.push({ name: type.name.range.toString(), type: type.type.range.toString() });
      }
    }
    return struct;
  }

  addAbiTypeAlias(typeKindName: string): void {

    if (!this.typeAliasSet.has(typeKindName)) {
      // It's the assemblyscript internal type
      let originalTypeName = this.findContractOriginalType(typeKindName);
      let wasmType = this.abiTypeLookup.get(originalTypeName);
      if (wasmType) {
        this.abiInfo.types.push(new AbiTypeAlias(typeKindName, wasmType));
      }
      this.typeAliasSet.add(typeKindName);
    }
  }

  /**
  * Find the original type name,
  * eg: declare type account_name = u64;
        declare type account_name_alias = account_name;

    findContractOriginalType("account_name_alias") return "account_name";
  */
  findContractOriginalType(typeKindName: string): string {

    var abiType: string | null = this.abiTypeLookup.get(typeKindName);
    if (abiType) {
      return typeKindName;
    }
    var typeAlias = this.program.typeAliases.get(typeKindName);
    if (typeAlias) {
      let commonaTypeName = typeAlias.type.range.toString();
      return this.findContractOriginalType(commonaTypeName);
    } else {
      return typeKindName;
    }
  }

  /**
  * Find the script original type name
  * @param typeKindName
  */
  findScriptOriginalTypeName(typeKindName: string): string {
    var typeAlias = this.program.typeAliases.get(typeKindName);
    if (typeAlias) {
      let commonaTypeName = typeAlias.type.range.toString();
      return this.findScriptOriginalTypeName(commonaTypeName);
    } else {
      return typeKindName;
    }
  }

  /**
  * Find assemblyscript original type name
  * eg: account_name return 'u64'
  *
  * @param typeKindName
  */
  findScriptOriginalType(typeKindName: string): Type | null {
    var originalName = this.findScriptOriginalTypeName(typeKindName);
    //Get the AssemblyScript original type
    var scriptType: Type | null = this.program.typesLookup.get(originalName);
    return scriptType;
  }

  // Check the FunctionPrototype weather has decoratorKind
  checkFuncPrototypeDecorator(funcPrototype: FunctionPrototype, decoratorKind: DecoratorKind): bool {
    var decorators = funcPrototype.declaration.decorators;
    var isActionDecorator = false;
    if (decorators) {
      for (let decorator of decorators) {
        if (decorator.decoratorKind == decoratorKind) {
          isActionDecorator = true;
        }
      }
    }
    return isActionDecorator;
  }

  isWrapWithQutation(str: string): bool {

    if (str == undefined || str == null) {
      return false;
    }
    return str.charAt(0) == "\"" && str.charAt(str.length - 1) == "\""
      ? true : false;
  }

  /**
  *  Check that element whether is functionPrototype
  *
  */
  isActionFuncPrototype(element: Element): bool {

    if (element.kind == ElementKind.FUNCTION_PROTOTYPE) {
      let funcType = <FunctionPrototype>element;
      return this.checkFuncPrototypeDecorator(funcType, DecoratorKind.ACTION);
    }
    return false;
  }

  /**
  * Resolve the class database decoreator
  */
  resolveClassDecorator(decorators: DecoratorNode[]): void {
    for (let decorator of decorators) {
      if (decorator.decoratorKind == DecoratorKind.DATABASE && decorator.arguments) {
        // Decorator argument must have two arguments
        if (decorator.arguments.length < 2) {
          throw new Error("Database decorator must have two arguments");
        }

        let type = decorator.arguments[0].range.toString();
        let name = this.retrieveArgumentText(decorator.arguments[1]);

        // let classPrototype:ClassPrototype = <ClassPrototype>this.resolveExpressionToElement(decorator.arguments[0]);
        // let indexType = this.getClassPrimaryKey(classPrototype.declaration);
        this.abiInfo.tables.push(new Table(name, type));
        this.resolveExpressionToStruct(decorator.arguments[0]);
      }
    }
  }

  getClassPrimaryKey(classDeclaration: ClassDeclaration ): string {

    if (!classDeclaration.members) {
      throw new Error(`Class:${classDeclaration.name} not have primary key.`);
    }
    const primaryMethodName = "primaryKey";
    for (let member of classDeclaration.members) {
      if (member.kind == NodeKind.METHODDECLARATION && member.name.range.toString() == primaryMethodName) {
        let method:MethodDeclaration = <MethodDeclaration>member;
        let returnType =  method.signature.returnType; 
        if (returnType.isNullable) {
          throw new Error(`The primaryKey method of class:${classDeclaration.name} must return value.`);
        } else {
          return this.findScriptOriginalTypeName(returnType.range.toString());
        }
      }
    }
    throw new Error(`Class:${classDeclaration.name} not have primary key.`);
  }

  retrieveArgumentText(expr: Expression): string {
    var argu: string = expr.range.toString();

    if (this.isWrapWithQutation(argu)) {
      return argu.substring(1, argu.length - 1);
    }

    var internalName = NodeUtil.getInternalName(expr);
    var element: Element | null = this.program.elementsLookup.get(internalName);

    if (element) {
      let declaration: VariableLikeDeclarationStatement | null = (<VariableLikeElement>element).declaration;
      if (declaration && declaration.initializer) {
        let literal: StringLiteralExpression = <StringLiteralExpression>declaration.initializer;
        return literal.value;
      }
    }
    throw new Error(`Cann't find constant ${internalName}`);
  }



  resolveExpressionToElement(expr: Expression): Element {

    var internalPath = expr.range.source.internalPath;
    var name = expr.range.toString();
    var internalName = `${internalPath}/${name}`;
    var element = this.program.elementsLookup.get(internalName);
    if (!element || element.kind != ElementKind.CLASS_PROTOTYPE) {
      throw new Error(`Element ${internalName} not found, pleasure make sure that class ${internalName} was existed.`);
    }
    return element;
  }

  /**
  *  Get struct from expression.
  */
  resolveExpressionToStruct(expr: Expression): void {

    var internalPath = expr.range.source.internalPath;
    var name = expr.range.toString();
    var internalName = `${internalPath}/${name}`;
    this.retrieveStructByInternalName(internalName);
  }

  retrieveStructByInternalName(internalName: string): void {

    var element = this.program.elementsLookup.get(internalName);
    if (!element || element.kind != ElementKind.CLASS_PROTOTYPE) {
      throw new Error(`Element ${internalName} not found, pleasure make sure that class ${internalName} was existed.`);
    }
    var classPrototype = <ClassPrototype>element;
    this.resolveClassPrototypeToStruct(classPrototype);
  }

  resolveClassPrototypeToStruct(classPrototype: ClassPrototype): void {

    var members: DeclarationStatement[] = classPrototype.declaration.members;
    var struct = new Struct();
    struct.name = classPrototype.simpleName;

    if (this.abiTypeLookup.get(struct.name)) {
      return;
    }

    struct.base = "";
    for (let member of members) {
      if (member.kind == NodeKind.FIELDDECLARATION) {
        let filedDeclare: FieldDeclaration = <FieldDeclaration>member;
        let filedName = member.name.range.toString();
        let filedType = filedDeclare.type;

        if (filedType) {
          let declaration:VariableDeclaration = new VariableDeclaration(this.program, filedType).resolveAbiParameterType();
          let fieldTypeName = filedType.range.toString();
          let type =  !declaration.isArray ? fieldTypeName :  `${declaration.getBaseTypeName(fieldTypeName)}[]`;
          struct.fields.push({ name: filedName, type:type });
        }
      }
    }
    this.addStruct(struct);
  }

  addStruct(struct: Struct): void {

    if (!this.structsLookup.has(struct.name)) {
      this.abiInfo.structs.push(struct);
      this.structsLookup.set(struct.name, struct);
    }
  }

  static nameMap: string = "._0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

  checkName(str: string): void {

    assert(str.length > 0, `Action name should not empty`);
    assert(str.length <= 21, `Action Name:${str} should be less than 21 characters.`);
  }

  /**
  *  Resolve ClassPrototype to dispatcher
  */
  resolveClassDispatcher(clzPrototype: ClassPrototype): Array<string> {

    var body = new Array<string>();
    var hasActionDecorator = false;
    if (clzPrototype.instanceMembers) {

      let contractName = clzPrototype.simpleName; //
      let contractVarName = "_" + contractName; // TODO To enhancement the code

      body.push(`  if (receiver == code) {`);
      body.push(`    let ${contractVarName} = new ${contractName}(receiver);`);
      body.push(`    let ds = ${contractVarName}.getDataStream();`);
      body.push(`    let action = new NameEx(actH, actL);`);
      // body.push(`    ${contractVarName}.onInit();`);


      for (let instance of clzPrototype.instanceMembers.values()) {
        if (this.isActionFuncPrototype(instance)) {

          this.resolveFunctionPrototype(<FunctionPrototype>instance);
          hasActionDecorator = true;
          let declaration: FunctionDeclaration = (<FunctionPrototype>instance).declaration; // FunctionDeclaration

          let funcName = declaration.name.range.toString();
          let types = declaration.signature.parameters; // FunctionDeclaration parameter types

          this.checkName(funcName);
          //let action = new NameEx(actH, actL);
          body.push(`    if (action == NEX("${funcName}")){`);

          let fields = new Array<string>();
          for (let index = 0; index < types.length; index++) {
            let type: ParameterNode = types[index];
            let parameterType = type.type.range.toString();
            let parameterName = type.name.range.toString();

            let variableDeclaration: VariableDeclaration = new VariableDeclaration(this.program, type.type);
            let abiType = variableDeclaration.resolveAbiParameterType();

            if (abiType.isArray) {
              if (abiType.kind == VarialbeKind.NUMBER) {
                body.push(`      let ${parameterName} = ds.readVector<${abiType.factType}>();`);
              } else if (abiType.kind == VarialbeKind.BOOL) {
                body.push(`      let ${parameterName} = ds.readVector<u8>();`);
              } else if (abiType.kind == VarialbeKind.STRING) {
                body.push(`      let ${parameterName} = ds.readStringVector();`);
              } else {
                body.push(`      let ${parameterName} = ds.readComplexVector<${abiType.baseType}>();`);
              }
            } else {
              if (abiType.kind == VarialbeKind.STRING) {
                body.push(`      let ${parameterName} = ds.readString();`);
              } else if (abiType.kind == VarialbeKind.BOOL) {
                body.push(`      let ${parameterName} = ds.read<u8>() != 0;`);
              } else if (abiType.kind == VarialbeKind.NUMBER) {
                body.push(`      let ${parameterName} = ds.read<${abiType.factType}>();`);
              } else {
                let internalName = NodeUtil.getInternalName(type.type);
                this.retrieveStructByInternalName(internalName);
                body.push(`      let ${parameterName} = new ${parameterType}();`);
                body.push(`      ${parameterName}.deserialize(ds);`);
              }
            }
            fields.push(parameterName);
          }
          body.push(`      ${contractVarName}.${funcName}(${fields.join(",")});`);
          body.push("    }");
        }
      }
      // body.push(`    ${contractVarName}.onStop();`);
      body.push("  }");

      if (hasActionDecorator) {
        if (clzPrototype.declaration.decorators) {
          this.resolveClassDecorator(clzPrototype.declaration.decorators);
        }
      }
    }
    return hasActionDecorator ? body : new Array();
  }

  resolveFunctionPrototype(funcPrototype: FunctionPrototype): void {

    var declaration: FunctionDeclaration = funcPrototype.declaration;
    var funcName = declaration.name.range.toString();
    var signature = funcPrototype.declaration.signature;
    var struct = this.toAbiStruct(funcName, signature);

    this.addStruct(struct);
    this.abiInfo.actions.push(new Action(funcName, funcName));
  }

  printTypeAliasInfo(): void {

    var typesLookupKeys = this.program.typesLookup.keys();
    for (let key of typesLookupKeys) {
      let value = this.program.typesLookup.get(key);
      if (value) {
        console.log(`type look up key: ${key}. value: ${value.kind}`);
      }
    }

    var typesAliasKeys = this.program.typeAliases.keys();
    for (let key of typesAliasKeys) {
      let value = this.program.typeAliases.get(key);
      if (value) {
        console.log(`type alias key: ${key}. Value: ${value.type.range.toString()}`);
      }
    }
  }

  printElementLookUpInfo(): void {
    var keys = this.program.elementsLookup.keys();
    for (let key of keys) {
      let value = this.program.elementsLookup.get(key);
      if (value) {
        console.log(`Element lookup key:${key}.Kind:${value.kind}`);
      }
    }
  }

  private printClassProtoTypeInfo(): void {
    var keys = this.program.elementsLookup.keys();
    for (let key of keys) {
      let value: Element | null = this.program.elementsLookup.get(key);
      if (value && value.kind == ElementKind.CLASS_PROTOTYPE) {
        // console.log(`Element lookup key:${key}.Kind:${value.kind}`);
        let classPrototype: ClassPrototype = <ClassPrototype>value;
        if (classPrototype.basePrototype) {
          console.log(`Element lookup key:${key}. Base prototype:${classPrototype.basePrototype.simpleName}`);
        }
      }

    }
  }

  resolve(): void {

    // this.printTypeAliasInfo();
    // this.printElementLookUpInfo();
    // this.findDBManager();
    // this.printClassProtoTypeInfo();

    var serializeHelper: SerializeHelper = new SerializeHelper(this.program);
    serializeHelper.resolve();
    this.fileSerializeLookup = serializeHelper.fileSerializeLookup;

    var dispatchBuffer = new Array<string>();

    for (let element of this.program.elementsLookup.values()) {
      // The element is ClassPrototype
      if (element.kind == ElementKind.CLASS_PROTOTYPE) {
        let clzPrototype = <ClassPrototype>element;
        if (!this.elementLookup.has(clzPrototype.internalName)) {
          let classDispatch: Array<string> = this.resolveClassDispatcher(clzPrototype);
          classDispatch.forEach((value: string, index: number): void => {
            dispatchBuffer.push(value);
          });
          this.elementLookup.set(clzPrototype.internalName, element);
        }
      }
    }

    if (dispatchBuffer.length == 0) {
      // throw new Error(`The smart contract must specify one action.`);
    }

    this.dispatch = this.assemblyDispatch(dispatchBuffer);
  }

  hasElement(name: string): bool {
    var element: Element | null = this.program.elementsLookup.get(name);
    return element ? true : false;
  }

  // Concat the dispatch message
  private assemblyDispatch(body: Array<string>): string {

    var sb = new Array<string>();
    sb.push("export function apply(receiver: u64, code: u64, actH: u64, actL: u64): void {");

    body.forEach((value: string, index: number): void => {
      sb.push(value);
    });
    sb.push("}");

    return sb.join("\n");
  }
}
