Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF7479CD
	for <asahi@lists.linux.dev>; Tue, 31 Jan 2023 13:18:09 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id b5so7778172plz.5
        for <asahi@lists.linux.dev>; Tue, 31 Jan 2023 05:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D+WiO9QNgXQ47tIOAmuZXNBx3OPHMSh5YIxTb3m81Tc=;
        b=UUI6a6vJJk4cJih3kJvDQ5S3uemUqGf7WfUthjaiKuir2YRKhl4uzvxOzaB4CtsGTK
         qE6dkLouJDH1E0s94fmKHhlHCxKrpAdX3EAko7lZXckzlFuzz6rsHWa0MrvAjoU6S/13
         u79APfE18Vr8Zv8I5rYya0vtRXT6ebyi7lcr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+WiO9QNgXQ47tIOAmuZXNBx3OPHMSh5YIxTb3m81Tc=;
        b=gp8u1UYfnH6u7MxMm25lu6nC/t6ZxektvrYrjON33ciWjgYhu8P2AuC5Zodkm/6DRY
         gc4yrAPAcgEsbaVj/JN25up2Tgzk2DOd94fwl6zDn5JzRqTAkl+YyMILi9oVKVebc8Ep
         aT/eC0MoT7o3QHDvzULbeq4dBWyCLcpFbr9KzpJYRuBO9s0Vu607by7jBBOcxYPqzcrJ
         IMcK1jdERs5O0Rs21MZI6ETbK9aeBZBRzdJsIIktfuO8iK5LhtQF68dZt6m+xgn598Py
         J10LXmdRGMm9zIMvHnBGxKXvGXBKpSfqQXcTh8VuMBZOPvSo0kK3Wj7sPn+qXJme/yr0
         uEjA==
X-Gm-Message-State: AO0yUKXzsIGqIYbKHNLp9Aw3s74sMzqX2/BVqtUcfUgba4vRTFsKoct7
	bQk9YxxLdFXWIZVB1lUbfLv8jw==
X-Google-Smtp-Source: AK7set8BEakqNepA6gKGPtI38cFRulrXnuyJElw2b1NAulYQLSiOc80+P+OspHNlxRdbO9q6bgiNTg==
X-Received: by 2002:a17:902:e74d:b0:196:7103:259f with SMTP id p13-20020a170902e74d00b001967103259fmr12943785plf.7.1675171088675;
        Tue, 31 Jan 2023 05:18:08 -0800 (PST)
Received: from [10.176.68.61] ([192.19.148.250])
        by smtp.gmail.com with ESMTPSA id je5-20020a170903264500b001896522a23bsm9816364plb.39.2023.01.31.05.18.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 05:18:07 -0800 (PST)
Message-ID: <f71ef248-1019-a70d-3f07-1b7874772cf8@broadcom.com>
Date: Tue, 31 Jan 2023 14:18:00 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/5] brcmfmac: Drop all the RAW device IDs
To: Hector Martin <marcan@marcan.st>, Arend van Spriel <aspriel@gmail.com>,
 Franky Lin <franky.lin@broadcom.com>,
 Hante Meuleman <hante.meuleman@broadcom.com>, Kalle Valo <kvalo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Alexander Prutskov <alep@cypress.com>,
 Chi-Hsien Lin <chi-hsien.lin@cypress.com>,
 Wright Feng <wright.feng@cypress.com>, Ian Lin <ian.lin@infineon.com>,
 Soontak Lee <soontak.lee@cypress.com>, Joseph chuang <jiac@cypress.com>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Aditya Garg <gargaditya08@live.com>, asahi@lists.linux.dev,
 linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
 SHA-cyfmac-dev-list@infineon.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230131112840.14017-1-marcan@marcan.st>
 <20230131112840.14017-2-marcan@marcan.st>
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20230131112840.14017-2-marcan@marcan.st>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000b2c71a05f38f29dc"

--000000000000b2c71a05f38f29dc
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/31/2023 12:28 PM, 'Hector Martin' via BRCM80211-DEV-LIST,PDL wrote:
> These device IDs are only supposed to be visible internally, in devices
> without a proper OTP. They should never be seen in devices in the wild,
> so drop them to avoid confusion.

Thanks for this cleanup.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c       | 4 ----
>   drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h | 4 ----
>   2 files changed, 8 deletions(-)
> 
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> index ae57a9a3ab05..93f961d484c3 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> @@ -2589,17 +2589,14 @@ static const struct dev_pm_ops brcmf_pciedrvr_pm = {
>   static const struct pci_device_id brcmf_pcie_devid_table[] = {
>   	BRCMF_PCIE_DEVICE(BRCM_PCIE_4350_DEVICE_ID, WCC),
>   	BRCMF_PCIE_DEVICE_SUB(0x4355, BRCM_PCIE_VENDOR_ID_BROADCOM, 0x4355, WCC),
> -	BRCMF_PCIE_DEVICE(BRCM_PCIE_4354_RAW_DEVICE_ID, WCC),
>   	BRCMF_PCIE_DEVICE(BRCM_PCIE_4356_DEVICE_ID, WCC),
>   	BRCMF_PCIE_DEVICE(BRCM_PCIE_43567_DEVICE_ID, WCC),
>   	BRCMF_PCIE_DEVICE(BRCM_PCIE_43570_DEVICE_ID, WCC),
> -	BRCMF_PCIE_DEVICE(BRCM_PCIE_43570_RAW_DEVICE_ID, WCC),
>   	BRCMF_PCIE_DEVICE(BRCM_PCIE_4358_DEVICE_ID, WCC),
>   	BRCMF_PCIE_DEVICE(BRCM_PCIE_4359_DEVICE_ID, WCC),
>   	BRCMF_PCIE_DEVICE(BRCM_PCIE_43602_DEVICE_ID, WCC),
>   	BRCMF_PCIE_DEVICE(BRCM_PCIE_43602_2G_DEVICE_ID, WCC),
>   	BRCMF_PCIE_DEVICE(BRCM_PCIE_43602_5G_DEVICE_ID, WCC),
> -	BRCMF_PCIE_DEVICE(BRCM_PCIE_43602_RAW_DEVICE_ID, WCC),
>   	BRCMF_PCIE_DEVICE(BRCM_PCIE_4364_DEVICE_ID, BCA),
>   	BRCMF_PCIE_DEVICE(BRCM_PCIE_4365_DEVICE_ID, BCA),
>   	BRCMF_PCIE_DEVICE(BRCM_PCIE_4365_2G_DEVICE_ID, BCA),
> @@ -2611,7 +2608,6 @@ static const struct pci_device_id brcmf_pcie_devid_table[] = {
>   	BRCMF_PCIE_DEVICE(BRCM_PCIE_4371_DEVICE_ID, WCC),
>   	BRCMF_PCIE_DEVICE(BRCM_PCIE_4378_DEVICE_ID, WCC),
>   	BRCMF_PCIE_DEVICE(CY_PCIE_89459_DEVICE_ID, CYW),
> -	BRCMF_PCIE_DEVICE(CY_PCIE_89459_RAW_DEVICE_ID, CYW),
>   	{ /* end: all zeroes */ }
>   };
>   
> diff --git a/drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h b/drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h
> index f4939cf62767..a211a72fca42 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h
> +++ b/drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h
> @@ -71,17 +71,14 @@
>   /* PCIE Device IDs */
>   #define BRCM_PCIE_4350_DEVICE_ID	0x43a3
>   #define BRCM_PCIE_4354_DEVICE_ID	0x43df
> -#define BRCM_PCIE_4354_RAW_DEVICE_ID	0x4354
>   #define BRCM_PCIE_4356_DEVICE_ID	0x43ec
>   #define BRCM_PCIE_43567_DEVICE_ID	0x43d3
>   #define BRCM_PCIE_43570_DEVICE_ID	0x43d9
> -#define BRCM_PCIE_43570_RAW_DEVICE_ID	0xaa31
>   #define BRCM_PCIE_4358_DEVICE_ID	0x43e9
>   #define BRCM_PCIE_4359_DEVICE_ID	0x43ef
>   #define BRCM_PCIE_43602_DEVICE_ID	0x43ba
>   #define BRCM_PCIE_43602_2G_DEVICE_ID	0x43bb
>   #define BRCM_PCIE_43602_5G_DEVICE_ID	0x43bc
> -#define BRCM_PCIE_43602_RAW_DEVICE_ID	43602
>   #define BRCM_PCIE_4364_DEVICE_ID	0x4464
>   #define BRCM_PCIE_4365_DEVICE_ID	0x43ca
>   #define BRCM_PCIE_4365_2G_DEVICE_ID	0x43cb
> @@ -92,7 +89,6 @@
>   #define BRCM_PCIE_4371_DEVICE_ID	0x440d
>   #define BRCM_PCIE_4378_DEVICE_ID	0x4425
>   #define CY_PCIE_89459_DEVICE_ID         0x4415
> -#define CY_PCIE_89459_RAW_DEVICE_ID     0x4355
>   
>   /* brcmsmac IDs */
>   #define BCM4313_D11N2G_ID	0x4727	/* 4313 802.11n 2.4G device */

--000000000000b2c71a05f38f29dc
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
2Gzj3QNJRLsZu1TLyOyBBIr/BE7UiY3RabgRzknBGAPmzhS+fmyM8OtM5BYBsFBrSUFtZZO2p/tf
Nbc24J2zf2peoZ8MK+7WQqummYlOnz+FyDkA9EybeNMcS5C+xi/PAgMBAAGjggHdMIIB2TAOBgNV
HQ8BAf8EBAMCBaAwgaMGCCsGAQUFBwEBBIGWMIGTME4GCCsGAQUFBzAChkJodHRwOi8vc2VjdXJl
Lmdsb2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcnQwQQYI
KwYBBQUHMAGGNWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24y
Y2EyMDIwME0GA1UdIARGMEQwQgYKKwYBBAGgMgEoCjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3
dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAJBgNVHRMEAjAAMEkGA1UdHwRCMEAwPqA8oDqG
OGh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3Js
MCcGA1UdEQQgMB6BHGFyZW5kLnZhbnNwcmllbEBicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYB
BQUHAwQwHwYDVR0jBBgwFoAUljPR5lgXWzR1ioFWZNW+SN6hj88wHQYDVR0OBBYEFIikAXd8CEtv
ZbDflDRnf3tuStPuMA0GCSqGSIb3DQEBCwUAA4IBAQCdS5XCYx6k2GGZui9DlFsFm75khkqAU7rT
zBX04sJU1+B1wtgmWTVIzW7ugdtDZ4gzaV0S9xRhpDErjJaltxPbCylb1DEsLj+AIvBR34caW6ZG
sQk444t0HPb29HnWYj+OllIGMbdJWr0/P95ZrKk2bP24ub3ZP/8SyzrohfIba9WZKMq6g2nTLZE3
BtkeSGJx/8dy0h8YmRn+adOrxKXHxhSL8BNn8wsmIZyYWe6fRcBtO3Ks2DOLyHCdkoFlN8x9VUQF
N2ulEgqCbRKkx+qNirW86eF138lr1gRxzclu/38ko//MmkAYR/+hP3WnBll7zbpIt0jc9wyFkSqH
p8a1MYICbTCCAmkCAQEwazBbMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1z
YTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMgUGVyc29uYWxTaWduIDIgQ0EgMjAyMAIMTv1t
bpIzNUky46LXMA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCBGXQO4RV9EvCrVf9rG
Rkm24mBb0vCROLuWkrOR0NipgDAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJ
BTEPFw0yMzAxMzExMzE4MDlaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUDBAEqMAsGCWCGSAFl
AwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEA7QwgBgm5tBUFXjgAoYepRE9txfqbLt5Zq7Pu
xpTsFhQ5rGsz2WnNG9wqsxQZ8lvvuxBGyKif0p8bwZxb49XCtZixUmCWjKGJz+uSLwTPL1P3ObkH
NI8wRBh5J2dOx+7CRSvs8v6t5RzmZyusrtIxB56pV3qF6UJ3lWo9trBWopQf0mZdiqDI92nLykPn
6GKGG+BrRRW/a+d+CiygcJJejjyu6q9Gjin01CAOG+kaOTTq1vpwCMtsG52hwhxeJ6wMBkfkey+B
PoDMriHmNMCq1p4/wM5/TFkTYczOIkNc9e1NFpmdtMHzc80j9VPhGKZea8BTo5ZhU8KYjSJPAnqg
aA==
--000000000000b2c71a05f38f29dc--
