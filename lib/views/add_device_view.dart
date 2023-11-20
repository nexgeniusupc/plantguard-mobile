import 'package:flutter/material.dart';

class AddDeviceView extends StatefulWidget {
  const AddDeviceView({Key? key}) : super(key: key);

  @override
  State<AddDeviceView> createState() => _AddDeviceViewState();
}

class _AddDeviceViewState extends State<AddDeviceView> {
  String text = 'When any household member adds a device, it appears here';

  Size size = const Size(0, 0);
  double width = 0;
  double height = 0;
  _AddDeviceViewState() {
    width = size.width;
    height = size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Devices',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
        ),
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.all(2.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://static-cdn.jtvnw.net/jtv_user_pictures/c751a0a6-0948-43c7-a1aa-0a87a7918f92-profile_image-300x300.png',
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Image.network(
                'https://img.freepik.com/premium-vector/marketing-automation-system-abstract-concept-vector-illustration_107173-29318.jpg?w=826',
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  width: 150,
                  height: 30,
                  child: FilledButton.tonal(
                    onPressed: () {
                      _displayBottomSheet(context);
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        Text('Add Device'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _displayBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.9,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 20.0, left: 20.0),
              child: IconButton(
                icon: const Icon(Icons.close),
                tooltip: 'close pop up',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      'Set up a device',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Set up a new device or add an existing device or service to your home',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Divider(
                    height: 20.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Icon(
                          Icons.home,
                          color: Colors.lightBlue,
                        ),
                      ),
                      Container(
                          constraints: const BoxConstraints(
                            minWidth: 50,
                            maxWidth: 240,
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 20.0, left: 20.0),
                                child: Text('New device'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20.0, top: 2.0),
                                child: Text(
                                  softWrap: true,
                                  maxLines: 3,
                                  'lorum ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation',
                                ),
                              ),
                            ],
                          ),),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
