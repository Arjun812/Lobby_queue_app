class TableData{
  final String? date;
    final  String? vNo;
  final  String? studentName;
  final   String? className;
  final String? parentsName;
  final     String? entryTime;
  TableData({
  this.date,this.className,this.entryTime,this.parentsName,this.studentName,this.vNo
  });
}

List<TableData> queueList = [
  TableData(date: "10/09/2022",vNo: "SHB-2343",studentName: "Alex",className: "LKG-A",parentsName: "James",entryTime: "16:35"),
  TableData(date: "13/09/2022",vNo: "SHB-2343",studentName: "Bond",className: "LKG-A",parentsName: "James",entryTime: "16:35"),
  TableData(date: "12/09/2022",vNo: "SHB-2343",studentName: "Alex",className: "LKG-A",parentsName: "James",entryTime: "16:35"),
  TableData(date: "12/09/2022",vNo: "SHB-2343",studentName: "Siri",className: "LKG-A",parentsName: "James",entryTime: "16:35"),
  TableData(date: "10/09/2022",vNo: "SHB-2343",studentName: "Harry",className: "LKG-A",parentsName: "James",entryTime: "16:35"),
  TableData(date: "11/10/2022",vNo: "SHB-2343",studentName: "Potter",className: "LKG-A",parentsName: "James",entryTime: "16:35"),
  TableData(date: "10/09/2022",vNo: "SHB-2343",studentName: "Kane",className: "LKG-A",parentsName: "James",entryTime: "16:35"),
  TableData(date: "10/09/2022",vNo: "SHB-2343",studentName: "John",className: "LKG-A",parentsName: "James",entryTime: "16:35"),
];