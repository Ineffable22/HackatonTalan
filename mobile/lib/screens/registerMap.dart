import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hackaton/providers/register.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class RegisterMap extends StatelessWidget {
  const RegisterMap({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Stack(
          children: [
            GoogleMap(
                initialCameraPosition: const CameraPosition(
                    target: LatLng(
                      -12.0278048,
                      -77.0115467,
                    ),
                    zoom: 15),
                onCameraMove: (CameraPosition pos) {
                  context.read<UserRegister>().setLatLong(pos.target.latitude, pos.target.longitude);
                },
            ),
            Center(
              child: SizedBox(
                width: 150,
                child: //const Text("")
                Lottie.asset('assets/pin.json'),
              ),
            ),
            Positioned(
              bottom: 0,
              child: CupertinoButton.filled(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Ok")),
            )

          ],
        )
    );
  }
}
