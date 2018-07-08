//
//  CPPTest.cpp
//  helloworldBase
//
//  Created by Shunsuke Tsujimoto on 2018/07/08.
//  Copyright © 2018年 Shunsuke Tsujimoto. All rights reserved.
//

#include "CPPTest.h"
#include "xxtea.h"
using namespace std;

#define SECURITY_KEY "rHvFaRHC5A"

CPPTest::CPPTest()
{
    printf("コンストラクタ\n");
    string str = "PHWymibeIqr3TErFZYsbLYYAVC1ntsuXdKTnDcLLSYWfC0LwDjnAtJQzZw8FEIEim443BfFzJ80DnevAkedTHOlljcWLFGbpxyWxnRlNA9jWqgRjXjXnEuonNh0uZsrlTQBNDrHqpWRtFpGoBFnXvRUpaZsMtQ02jwJTLTDewdd2ubeN9VoZjprBNtsas4ereXtiLFBM";
    printf("1:%s\n",str.c_str());

    
    size_t len;
    unsigned char *encrypt_data = (unsigned char *)xxtea_encrypt(str.c_str(), str.size(), SECURITY_KEY, &len);

    string deStr = string((const char*)encrypt_data);
    printf("destr!:%s\n",deStr.c_str());

    size_t len2;
    char *decrypt_data = (char *)xxtea_decrypt(deStr.c_str(), deStr.size(), SECURITY_KEY, &len2);
    if (strncmp(str.c_str(), decrypt_data, deStr.size()) == 0)
    {
        printf("success!:%s len:%ld\n",decrypt_data,len2);
    }
    else
    {
        printf("failed!\n");
    }
}

CPPTest::~CPPTest()
{
    printf("デストラクタ¥n");
}
