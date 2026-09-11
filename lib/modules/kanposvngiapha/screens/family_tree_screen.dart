import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';

class FamilyTreeScreen extends StatefulWidget {
  const FamilyTreeScreen({Key? key}) : super(key: key);

  @override
  _FamilyTreeScreenState createState() => _FamilyTreeScreenState();
}

class _FamilyTreeScreenState extends State<FamilyTreeScreen> {
  final Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  @override
  void initState() {
    super.initState();
    // Khởi tạo thuật toán vẽ cây Top-Bottom
    builder
      ..siblingSeparation = (100)
      ..levelSeparation = (150)
      ..subtreeSeparation = (150)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
      
    // Sinh Mock Data 3 Đời
    _createMockTree();
  }

  void _createMockTree() {
    // Đời 1 (Ông)
    final node1 = Node.Id('Ông Tổ');
    
    // Đời 2 (Con)
    final node2 = Node.Id('Con Trai Trưởng');
    final node3 = Node.Id('Con Gái');
    final node4 = Node.Id('Con Trai Thứ');
    
    // Đời 3 (Cháu)
    final node5 = Node.Id('Cháu Đích Tôn');
    final node6 = Node.Id('Cháu Gái');
    final node7 = Node.Id('Cháu Ngoại 1');

    // Quan hệ Đời 1 -> Đời 2
    graph.addEdge(node1, node2);
    graph.addEdge(node1, node3);
    graph.addEdge(node1, node4);
    
    // Quan hệ Đời 2 -> Đời 3
    graph.addEdge(node2, node5);
    graph.addEdge(node2, node6);
    graph.addEdge(node3, node7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cây Gia phả (Mạng lưới)'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.zoom_in_map),
                SizedBox(width: 8),
                Text('Vuốt để di chuyển - Chụm để phóng to/nhỏ'),
              ],
            ),
          ),
          Expanded(
            child: InteractiveViewer(
              constrained: false,
              boundaryMargin: const EdgeInsets.all(100),
              minScale: 0.1,
              maxScale: 5.6,
              child: GraphView(
                graph: graph,
                algorithm: BuchheimWalkerAlgorithm(builder, TreeEdgeRenderer(builder)),
                paint: Paint()
                  ..color = Colors.green
                  ..strokeWidth = 2
                  ..style = PaintingStyle.stroke,
                builder: (Node node) {
                  var id = node.key?.value as String;
                  return _rectangleWidget(id);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _rectangleWidget(String id) {
    return InkWell(
      onTap: () {
        print('Đã nhấn vào $id');
        // TODO: Hiển thị dialog thông tin chi tiết
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.green, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ]
        ),
        child: Column(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              id,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
