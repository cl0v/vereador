import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presidente/app/data/model/process_model.dart';
import 'package:presidente/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.blueGrey[200],
        // drawer: Drawer(),
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),
            ),
          ),
          toolbarHeight: 160,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Auto Vot'),
              SizedBox(
                height: 16,
              ),
              Text(
                controller.vereadorModel.name,
                // style: TextStyle(fontSize: 8),
              ),
              Text(
                'Vereador',
                style: TextStyle(fontSize: 16),
              ),
              // Text(controller.vereadorModel.name),
            ],
          ),

          // centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.flip_camera_android),
                text: 'Abertos',
              ),
              Tab(
                icon: Icon(Icons.android),
                text: 'Em processo',
              ),
              Tab(
                icon: Icon(Icons.history),
                text: 'Finalizados',
              ),
            ],
          ),
        ),

        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 42,
          ),
          // shape: CircularNotchedRectangle(),
          // notchedShape: 

        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
            onPressed: controller.onAddPressed,
            child: Icon(Icons.add),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 38.0),
          child: TabBarView(
            children: [
              Obx(() {
                if (controller.streamProcessos.value == null)
                  return Center(child: CircularProgressIndicator());
                return ListView(
                  children: controller.streamProcessos.value
                      .map((mod) => ProcessCard(
                            processo: mod,
                          ))
                      .toList(),
                );
              }),
              // ListView(
              //   children: controller.processos
              //       .map<ProcessCard>((p) => ProcessCard(
              //             processo: p,
              //           ))
              //       .toList(),
              // ),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}

class TripleFab extends StatelessWidget {
  final controller;

  const TripleFab({Key key, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ,
          FloatingActionButton(
            onPressed: controller.onRemovePressed,
            child: Icon(Icons.remove),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          FloatingActionButton(
            onPressed: controller.onEditPressed,
            child: Icon(Icons.edit),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ],
      ),
    );
  }
}

class ProcessCard extends StatelessWidget {
  final ProcessModel processo;

  const ProcessCard({Key key, this.processo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text(processo.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(processo.subtitle),
          Text('Restam ${processo.vereadorLack} vereadores'),
        ],
      ),
      leading: Icon(
        Icons.add_box_outlined,
        size: 72,
      ),
      isThreeLine: true,
    )
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Text(processo.title),
        //     Text(processo.subtitle),
        //     Text('Restam ${processo.vereadorLack} vereadores para votar')
        //   ],
        // ),
        );
  }
}
