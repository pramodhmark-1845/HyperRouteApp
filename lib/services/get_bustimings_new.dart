import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hike_latest/services/Transaction_process.dart';

class boxdata {
  int ?size;
  int ? value;
  boxdata({this.size,this.value});
}

class startend{
  Map<String, dynamic>?start;
  Map<String, dynamic>?end;
  List<boxdata> ? b;
  startend({this.start,this.end,this.b});
}
//------------------------------------------------------------------------------------------------------------


List<Map<String, dynamic>> buses_start_n = [
];
List<Map<String, dynamic>> buses_end_n= [
];
List<startend>sortedbuses=[]; //List of all buses and details;


//-------------------------------------------------------------------------------------------------------------

List<String> available_buses=[];
Future getbuses_new(String Start, String End) async {
  available_buses.clear();
  buses_end_n.clear();
  buses_start_n.clear();
  sortedbuses.clear();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference collectionReference = firestore.collection('BusRoutes');

  QuerySnapshot querySnapshot = await collectionReference.get();
  List<Map<String, dynamic>> temp = [
  ];
  temp.add(querySnapshot.docs[0].data() as Map<String, dynamic>);
  print(temp[0]["Length"]);
  String Route="";
  List<String> RouteList=[];
  int found=0,length;
  for(int i=1;i<=temp[0]["Length"];i++)
    {
      Route=temp[0]["String"+i.toString()];
      RouteList=Route.split(", ");
      print(RouteList);
      // search for places
      length=RouteList.length;
      found=0;
      for(int j=1;j < length;j++)
        {
          if(RouteList[j]==Start || RouteList[j]==End) {
            found++;
          }
          if(found==2)
            {
              available_buses.add(RouteList[0]);
              break;
            }
        }
    }
  print(available_buses);


 //---------------------------------------------- get_bus_timings -----------------------------------------------------
  int buses_available_length = available_buses.length;
  QuerySnapshot start_details;
  QuerySnapshot end_details;
  int index=0;
  for(int i=0;i<buses_available_length;i++) {
    start_details = (await firestore.collection('BusDetails').doc(
        available_buses[i]).collection('BusRoute').where(
        "Place", isEqualTo: Start).get()) as QuerySnapshot<Object?>;

    for (var document in start_details.docs){
      buses_start_n.add(document.data() as Map<String, dynamic>);
       end_details = await FirebaseFirestore.instance
          .collection('BusDetails').doc(available_buses[i]).collection('BusRoute')
          .where("Place",isEqualTo: End )
          .where("BusId", isEqualTo: buses_start_n[index]['BusId'])
          .where("Slot", isEqualTo: buses_start_n[index]['Slot'])
          .where("TimeValue", isGreaterThan: buses_start_n[index]['TimeValue'])
          .get();
      if(end_details.docs.isEmpty)
      {
        buses_start_n.removeAt(index);
      }
      else {
        for (var d in end_details.docs) {
          buses_end_n.add(d.data() as Map<String, dynamic>);
        }
        index=index+1;
      }
    }
  }
  int l=buses_start_n.length;
  //sorting timings with time.
  for(int i=0;i<l;i++){
    sortedbuses.add(startend(start: buses_start_n[i],end: buses_end_n[i],b: []));
  }
  sortedbuses.sort((a,b)=>a.start!["TimeValue"].compareTo(b.start!["TimeValue"]));
  for(int i=0;i<l;i++){
    buses_start_n[i]=sortedbuses[i].start!;
    buses_end_n[i]=sortedbuses[i].end!;
  }
  await process_box_details();
  return;
}
//--------------------------------------------------get buses new function end---------------------------------------------------------------------------------


Future process_box_details() async{
  int length = buses_start_n.length;
  for(int i=0;i<length;i++)
    {
      print("here");
      sortedbuses[i].b= await getboxdetails(buses_start_n[i]["SerialNumber"], buses_end_n[i]["SerialNumber"], buses_start_n[i]["BusId"]);
    }
  return;
}

//-----------------------------------------Boxes Information---------------------------------//
Future<List<boxdata>> getboxdetails(int Start, int End, String BusId) async{
  print("here2");
  var data = await FirebaseFirestore.instance.collection('BusDetails').doc(BusId).get();
  print(data.data());
  print("here3");
  print(data.data()!["Box10"]);
  List<boxdata> b=[];
  String s=data.data()!["Box10"];
  int l=s.length;
  int i;
  for(i=Start-1;i<End;i++){
    if(s[i]!='0'){
      b.add(boxdata(size: 10,value: 0));
      break;
    }
  }
  if(i==End)
    b.add(boxdata(size: 10,value: 1));

  //-----------------------------------
  s=data.data()!["Box20"];
  for(i=Start-1;i<End;i++){
    if(s[i]!='0'){
      b.add(boxdata(size: 20,value: 0));
      break;
    }
  }
  if(i==End)
    b.add(boxdata(size: 20,value: 1));

  //--------------------------------------

  s=data.data()!["Box30"];
  for(i=Start-1;i<End;i++){
    if(s[i]!='0'){
      b.add(boxdata(size: 30,value: 0));
      break;
    }
  }
  if(i==End)
    b.add(boxdata(size: 30,value: 1));

  //----------------------------------------

  s=data.data()!["Box40"];
  for(i=Start-1;i<End;i++){
    if(s[i]!='0'){
      b.add(boxdata(size: 40,value: 0));
      break;
    }
  }
  if(i==End)
    b.add(boxdata(size: 40,value: 1));

  //----------------------------------------

  s=data.data()!["Box50"];
  for(i=Start-1;i<End;i++){
    if(s[i]!='0'){
      b.add(boxdata(size: 50,value: 0));
      break;
    }
  }
  if(i==End)
    b.add(boxdata(size: 50,value: 1));

  print("here4");
  return b;
}
