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

#define SECURITY_KEY "czquyc67EP404676tPQFAntSOz9dzvrL19XR4JWk8XZkJC1A346f0vKA6xO0ck8P"

CPPTest::CPPTest()
{
    printf("コンストラクタ\n");
    string str = "-C880OT/97Zbf/R9!v5x%R0%%e(IuaU&Y)Syd/w74A5x6#7-KY3nsP-Rb)Ivp18-";
    printf("1:%s\n",str.c_str());
    
    size_t len = 0;
    // xxtea暗号化
    unsigned char *encrypt_data = (unsigned char *)xxtea_encrypt(str.c_str(), str.size(), SECURITY_KEY, &len);

    string deStr = string((const char*)encrypt_data);
    printf("destr!:%s\n",deStr.c_str());

    // xxtea復号
    size_t len2 = 0;
    const char *decrypt_data = (const char *)xxtea_decrypt(deStr.c_str(), deStr.size(), SECURITY_KEY, &len2);
    printf("len2:%ld\n",len2);
    if (len2 > 0)
    {
        if (strncmp(str.c_str(), decrypt_data, deStr.size()) == 0)
        {
            printf("success!:%s len:%ld\n",decrypt_data,len2);
        }
        else
        {
            printf("failed!\n");
        }
    }
}

CPPTest::~CPPTest()
{
    printf("デストラクタ¥n");
}
