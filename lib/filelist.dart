import 'package:googleapis/storage/v1.dart';
import 'package:googleapis_auth/auth_io.dart';

final _credentials = new ServiceAccountCredentials.fromJson(r'''
{
  "type": "service_account",
  "project_id": "android-1-ff119",
  "private_key_id": "3f2e113f60bb8777e2374520ea1c93f288d39b0b",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCvl1FO8dvKe35G\nbZeb+5uQsMDoexNn4cs9CfUBtVIx/NOn3YKDoTg0Uk2GI66nKTF/6Mo/twiOqxAz\nuo/IHODyjgbv2ihGmbEETznIQjFA8O6IOUhBrDnySD+KQEls3y3h8VmEVPOgU3wD\n6DtNBfU22c7RSC9vCDTz+e/lQIuG0KsYUiBIlvlnOVSGVRbFrbPQI2rebB6O/6QV\nrsi+coTUYBjJvJLL9kkjgrFxodMKxfrat0N2+PthyYrXBQXNzCRPpuOPyMbs7Tgr\nWPCm59we/lHuDN9J5DDxEvtq2p/DAu6uK/LKAluI6dNAFwZmj31pXGR7GZmiVwFp\nLct0f4vtAgMBAAECggEAFYeohtVFhaOURWbxKMVWWwytLqROqhVnwe17XvEAadQu\nEJ5qvyCQv2ubCVhNNT5qDRy6Vcsnz7R+aVVWBWuzElKjW5wEhbmZGKXtOBaTqvqP\nyOC7MSBAv6onrlg5GJIZ8mMRPpZbA/zQjzsVsFlLaqUUxJkFBeh787Fg/ptmMEqn\nwXBjoq4JJZR9xqjgn+upIesFINsugSzdnF5zY/U04rsTDsGBtDiYuiLRNq+J0SeY\nVxS1R3IhJ2J0uHZbB3bbYYpfdtcyb7D3w1qIUa/Tc1cHbJsBmcK7t/SgrVsQGaYy\n717R3DTMnPMZWkSumlMwbvdBtFxw2g3i9OvEmGiC4QKBgQDzB6SVCxjDPbRIUNVD\nxJljCRlcxyFv7gWbwExEzhqObKJlkygAnpZ1rxFAj5sfeoKUDx6moKcffveI7D4w\nH7ocNBKasC1fJIDAFkkFY4+ShmI3tvhN1+FYuL53mJFggQGZDBvIBiKaJl3q/8uX\nKr7KHYPbWCfzEV+PREw098xtDQKBgQC49k2aLeKh4pWUE7WbVuUNlEsNFVzIHpZn\nlJSYZPSUY6YJXJWfo0cfPqZszA1kNT2ozHh/JBZQV1YN1Z7s4MiQnvfMv9LsqB16\nwYvCkumkO9lVE2jz1EPuMBV6+Tdqi6yneygoDnCR7ttRla4T6+Yl9HZWSbfQdY+5\nm1xNjSiiYQKBgE2gIlSs37L1EZGLqCLmN+wnKt+0hxyeVVJDYNkVT+wwDMsO7tcL\n0Jk0WvlZJT4vvmeWUL7+T4NC5cPpWY+7gpGhnFOmdEeQfENemuJKw8AUhmivW65Z\nhxP0pnnC1KSTcDQ3ZuRD+WdtW9BE9f2J3LjoJoa4KMJ9yR0Uvpaok7Y9AoGAPBAv\nzxuLdwp/jGCCHvmu1CQN4yfGw227ZdOIFZzjF7TsXCnmpLp/BBRyMu5ogtwPM9uC\nXbc4T8qstT1jqISuXNhim+jG8/b767siSYMvwBd3UftFn7iUfqq6rv5zEnRdEt4Z\ngjh+McWhDvNOXkXCrRyfuRGjUVx72cgrxztJsMECgYA1ecCSZiZnnR1lIBg8HeEk\nOMw5Ay0+ytVIQT6a5o/7IAiqDvF6rMPWWsji5DdtCLSoBBsX1KUJj39xQ2KfsmLD\n/Ez6ar6U37lpVanI/tXxFzM9vU6yX8F9Xoaqg2+OIvtOPj/bwE79r2LmoOhTdyR+\neYjPzwTozopjBKnQLdqQtQ==\n-----END PRIVATE KEY-----\n",
  "client_email": "google-drive-api@android-1-ff119.iam.gserviceaccount.com",
  "client_id": "107143799481538042225",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/google-drive-api%40android-1-ff119.iam.gserviceaccount.com"
}
''');



const _SCOPES = const [StorageApi.DevstorageReadOnlyScope];

void main() {
  clientViaServiceAccount(_credentials, _SCOPES).then((http_client) {
    var storage = new StorageApi(http_client);
    storage.buckets.list('dart-on-cloud').then((buckets) {
      print("Received ${buckets.items.length} bucket names:");
      for (var file in buckets.items) {
        print(file.name);
      }
    });
  });
}

Future<void> _listGoogleDriveFiles() async {  
   var client = GoogleHttpClient(await googleSignInAccount.authHeaders);  
   var drive = ga.DriveApi(client);  
   drive.files.list(spaces: 'appDataFolder').then((value) {  
     setState(() {  
       list = value;  
     });  
     for (var i = 0; i < list.files.length; i++) {  
       print("Id: ${list.files[i].id} File Name:${list.files[i].name}");  
     }  
   });  
}
