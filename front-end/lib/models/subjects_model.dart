class ProgramModule {
  String? module_name;
  String? module_code;


  ProgramModule(
  { this.module_name,
    this.module_code,
  }

      );

  static List<ProgramModule> modules = [

    ProgramModule(module_name: 'HCI', module_code: 'ITU-07123'),
    ProgramModule(module_name: 'INFORMATION SYSTEMS', module_code: 'ITU-07143'),
    ProgramModule(module_name: 'PROGRAMMING ', module_code: 'ITU-071454')




  ];

//  I am using dummy data but later I can use API

}