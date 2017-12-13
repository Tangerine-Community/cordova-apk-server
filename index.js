const express = require('express')
const fileUpload = require('express-fileupload')
const app = express()
const exec = require('child_process').exec
const uuidv1 = require('uuid/v1')
const path = require('path')
 
// ya
 console.log('ya')

app.use(fileUpload())
app.use('/apks', express.static(path.join(__dirname, '/apks/')));
 
app.post('/upload', function(req, res) {
  if (!req.files) return res.status(400).send('No files were uploaded.')
  let uuid = uuidv1()
  let zipFile = req.files.zip
  zipFile.mv(`/cordova-apk-server/zips/${uuid}.zip`, function(err) {
    if (err) return res.status(500).send(err)
    exec(`${__dirname}/scripts/zip-to-apk.sh "/cordova-apk-server/zips/${uuid}.zip" "/cordova-apk-server/apks/${uuid}.zip"`, function(error, stdout, stderr) {
      console.log(stdout)
      console.log(stderr)
      res.send(uuid)
    })
  })
})

app.listen(80, () => console.log('Example app listening on port 80'))
