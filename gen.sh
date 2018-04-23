openssl genrsa -out shashki.online.key 2048
openssl req -new -key shashki.online.key -out shashki.online.csr -config shashki.online.conf
openssl req -new -out workingbit.csr -config workingbit.conf 
openssl genrsa -out ca.key 2048
openssl req -new -x509 -key ca.key -out ca.crt -config caREQ.conf
openssl x509 -req -in shashki.online.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out shashki.online.crt
cat shashki.online.crt ca.crt > shashki.online.bundle.crt
mkdir newcerts
touch index.txt
echo '01' > serial
openssl ca -config ca.conf -out shashki.online.crt -infiles shashki.online.csr 
openssl ca -config ca.conf -out workingbit.crt -extfile workingbit.extensions.conf -in workingbit.csr
openssl verify -CAfile ca.crt workingbit.crt
