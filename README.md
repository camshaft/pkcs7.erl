pkcs7.erl [![Build Status](https://travis-ci.org/camshaft/pkcs7.erl.png?branch=master)](https://travis-ci.org/camshaft/pkcs7.erl)
=========

PKCS7 binary padding for erlang

```erlang
1> Bin = <<"Needs padding">>.
2> Padded = pkcs7:pad(Bin).
3> Padded = <<78,101,101,100,115,32,112,97,100,100,105,110,103,3,3,3>>.
4> Unpadded = pkcs7:unpad(Padded).
5> Bin = Unpadded.
```
