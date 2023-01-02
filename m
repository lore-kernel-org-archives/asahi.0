Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFF85667
	for <asahi@lists.linux.dev>; Mon,  2 Jan 2023 18:27:35 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id t17so68238959eju.1
        for <asahi@lists.linux.dev>; Mon, 02 Jan 2023 10:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:subject:user-agent:references:in-reply-to:message-id
         :date:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ocCR9NzEpw2flhEFt4Hl7JgRBqhdrRalvQe/ThfWB70=;
        b=dZsixiHiNtBeqjCuRq3dLcC52/zKGw5Y78W84wYuNp8jD6onPlHCgh7NMbz74UM6Es
         uchts6fxg9AW54whPlqR/u7ZIo/6OlBUfQ4Wy7UrfEzyZkCKFLkJ9hNz6xdg9x3/C8y5
         ChCka4BlGr5Y4Ru9ZZhIw4w+MwM3n3Gbw5j4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:subject:user-agent:references:in-reply-to:message-id
         :date:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocCR9NzEpw2flhEFt4Hl7JgRBqhdrRalvQe/ThfWB70=;
        b=bGWq397+q9zw25sDusxZ5L+R5fq35Q5tnhctsH5rNTHCk9hI2x46i2k7Z9uWOHUUBl
         5LfnwzOUsZq9/2AjBaosq5h+LQfYSYM/Y+60Fw/iZMBLhzLQResNYzz7p50gliA4XNdd
         nZqvAT3uhhme8fsEM+fWMGfPp1fV8rCNLu2kdRsRDRcqv5l1E+FZblRpX6n7NIAflyAh
         cH1gxal0EMiFgd9OUP/2vcTzu+l+whDSvxfOm902Z936jrn0yxZIpYIhN6sO5MzkBseC
         1+Dccj42wKAm/MCzQMlxORUmfC/8YDyzBfRi7KhUrrbQKp+C7qg4wKlp7Uu4ythFFXqm
         xizw==
X-Gm-Message-State: AFqh2krzJLV0ceSvwrRfyLAkZ/WBzU+m79esLKNpOatFWKBBmY17d5m/
	9RCaBUfWVC3P7M5sdQQnNeWu2Q==
X-Google-Smtp-Source: AMrXdXuPdtJjvNeBLkhHExgDD6sthU5G5noinCFOqYgjyR0ccIJ4ls8gwh35k3Bmu8a3ba/EWhkIqQ==
X-Received: by 2002:a17:907:9b09:b0:849:e96f:521b with SMTP id kn9-20020a1709079b0900b00849e96f521bmr31430902ejc.32.1672684053670;
        Mon, 02 Jan 2023 10:27:33 -0800 (PST)
Received: from [192.168.178.38] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id lb2-20020a170907784200b0084aade9d6b5sm12205006ejc.17.2023.01.02.10.27.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Jan 2023 10:27:32 -0800 (PST)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Hector Martin <marcan@marcan.st>, Aditya Garg <gargaditya08@live.com>, <aspriel@gmail.com>, <hante.meuleman@broadcom.com>, <kvalo@kernel.org>, <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>, <lina@asahilina.net>, <franky.lin@broadcom.com>
CC: Orlando Chamberlain <redecorating@protonmail.com>, <brcm80211-dev-list@broadcom.com>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Asahi Linux <asahi@lists.linux.dev>
Date: Mon, 02 Jan 2023 19:27:31 +0100
Message-ID: <18573bd1a38.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <9c5bdb0a-0877-ed16-f09f-164a9dab16d4@marcan.st>
References: <F8829A7C-909E-4A1F-A22C-668220C5C06D@live.com>
 <f36dd8e3-9905-f04a-ed34-4be91ed1fec6@marcan.st>
 <F9EFCCD1-4407-42CC-8316-2F58AAC1AE7F@live.com>
 <ACC0D1F6-7857-4FF0-A474-4EC699572E1B@live.com>
 <9c5bdb0a-0877-ed16-f09f-164a9dab16d4@marcan.st>
User-Agent: AquaMail/1.41.0 (build: 104100234)
Subject: Re: [PATCH 1/2] brcmfmac: Use separate struct to declare firmware names for Apple OTP chips
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000d9dcb605f14c1a9b"

--000000000000d9dcb605f14c1a9b
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On January 2, 2023 4:15:41 PM Hector Martin <marcan@marcan.st> wrote:

> On 02/01/2023 23.40, Aditya Garg wrote:
>> From: Aditya Garg <gargaditya08@live.com>
>>
>> Commit 'dce45ded7619' added support for 89459 chip pcie device. It uses the
>> BRCM4355 chip which is also found in Apple hardware. However this commit
>> causes conflicts in the firmware naming between Apple hardware, which
>> supports OTP and other non-Apple hardwares. So, this patch makes these
>> Apple chips use their own firmware table so as to avoid possible conflicts
>> like these in the future.
>
> I think my reply to Arend flew over your head.
>
> My point was that I'd rather have the Broadcom/Cypress people actually
> answer my question so we can figure out how to do this *properly*,
> instead of doing "safer-but-dumb" things (like this patch) because we
> just don't have the information to do it properly.

Fair enough. Can you accurately (re)state your question and I will try to 
answer it.

Regards,
Arend

> - Hector




--000000000000d9dcb605f14c1a9b
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIQdwYJKoZIhvcNAQcCoIIQaDCCEGQCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg3OMIIFDTCCA/WgAwIBAgIQeEqpED+lv77edQixNJMdADANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA5MTYwMDAwMDBaFw0yODA5MTYwMDAwMDBaMFsxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBS
MyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
vbCmXCcsbZ/a0fRIQMBxp4gJnnyeneFYpEtNydrZZ+GeKSMdHiDgXD1UnRSIudKo+moQ6YlCOu4t
rVWO/EiXfYnK7zeop26ry1RpKtogB7/O115zultAz64ydQYLe+a1e/czkALg3sgTcOOcFZTXk38e
aqsXsipoX1vsNurqPtnC27TWsA7pk4uKXscFjkeUE8JZu9BDKaswZygxBOPBQBwrA5+20Wxlk6k1
e6EKaaNaNZUy30q3ArEf30ZDpXyfCtiXnupjSK8WU2cK4qsEtj09JS4+mhi0CTCrCnXAzum3tgcH
cHRg0prcSzzEUDQWoFxyuqwiwhHu3sPQNmFOMwIDAQABo4IB2jCCAdYwDgYDVR0PAQH/BAQDAgGG
MGAGA1UdJQRZMFcGCCsGAQUFBwMCBggrBgEFBQcDBAYKKwYBBAGCNxQCAgYKKwYBBAGCNwoDBAYJ
KwYBBAGCNxUGBgorBgEEAYI3CgMMBggrBgEFBQcDBwYIKwYBBQUHAxEwEgYDVR0TAQH/BAgwBgEB
/wIBADAdBgNVHQ4EFgQUljPR5lgXWzR1ioFWZNW+SN6hj88wHwYDVR0jBBgwFoAUj/BLf6guRSSu
TVD6Y5qL3uLdG7wwegYIKwYBBQUHAQEEbjBsMC0GCCsGAQUFBzABhiFodHRwOi8vb2NzcC5nbG9i
YWxzaWduLmNvbS9yb290cjMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjMuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yMy5jcmwwWgYDVR0gBFMwUTALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgEo
CjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAN
BgkqhkiG9w0BAQsFAAOCAQEAdAXk/XCnDeAOd9nNEUvWPxblOQ/5o/q6OIeTYvoEvUUi2qHUOtbf
jBGdTptFsXXe4RgjVF9b6DuizgYfy+cILmvi5hfk3Iq8MAZsgtW+A/otQsJvK2wRatLE61RbzkX8
9/OXEZ1zT7t/q2RiJqzpvV8NChxIj+P7WTtepPm9AIj0Keue+gS2qvzAZAY34ZZeRHgA7g5O4TPJ
/oTd+4rgiU++wLDlcZYd/slFkaT3xg4qWDepEMjT4T1qFOQIL+ijUArYS4owpPg9NISTKa1qqKWJ
jFoyms0d0GwOniIIbBvhI2MJ7BSY9MYtWVT5jJO3tsVHwj4cp92CSFuGwunFMzCCA18wggJHoAMC
AQICCwQAAAAAASFYUwiiMA0GCSqGSIb3DQEBCwUAMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9v
dCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMB4XDTA5
MDMxODEwMDAwMFoXDTI5MDMxODEwMDAwMFowTDEgMB4GA1UECxMXR2xvYmFsU2lnbiBSb290IENB
IC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2JhbFNpZ24wggEiMA0GCSqG
SIb3DQEBAQUAA4IBDwAwggEKAoIBAQDMJXaQeQZ4Ihb1wIO2hMoonv0FdhHFrYhy/EYCQ8eyip0E
XyTLLkvhYIJG4VKrDIFHcGzdZNHr9SyjD4I9DCuul9e2FIYQebs7E4B3jAjhSdJqYi8fXvqWaN+J
J5U4nwbXPsnLJlkNc96wyOkmDoMVxu9bi9IEYMpJpij2aTv2y8gokeWdimFXN6x0FNx04Druci8u
nPvQu7/1PQDhBjPogiuuU6Y6FnOM3UEOIDrAtKeh6bJPkC4yYOlXy7kEkmho5TgmYHWyn3f/kRTv
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBVYwggQ+oAMCAQICDE79bW6SMzVJMuOi1zANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMjA5MTAxMTQzMjNaFw0yNTA5MTAxMTQzMjNaMIGV
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xGTAXBgNVBAMTEEFyZW5kIFZhbiBTcHJpZWwxKzApBgkqhkiG
9w0BCQEWHGFyZW5kLnZhbnNwcmllbEBicm9hZGNvbS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IB
DwAwggEKAoIBAQDxOB8Yu89pZLsG9Ic8ZY3uGibuv+NRsij+E70OMJQIwugrByyNq5xgH0BI22vJ
LT7VKCB6YJC88ewEFfYi3EKW/sn6RL16ImUM40beDmQ12WBquJRoxVNyoByNalmTOBNYR95ZQZJw
1nrzaoJtK0XIsv0dNCUcLlAc+jHkngD+I0ptVuWoMO1BcJexqJf5iX2M1CdC8PXTh9g4FIQnG2mc
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
bpIzNUky46LXMA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCBYC8y+Pd6rsqYcGrld
sRAuLT6oT4u6pwom0HIjNJ0+2TAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJ
BTEPFw0yMzAxMDIxODI3MzNaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUDBAEqMAsGCWCGSAFl
AwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEASWHzsKxnNHmGpkxdEAQ+z/MMOendn9aP6kRV
2Jceo91TOVxkxesvbuZc3PXz8dbfMND4T2Urde+z2sDa9LCJ9tgbK7+pND9Ch1IR7MxQ/9KvYany
GIJDW9GjBGfE/iIPMqBwL6OmUfLO1wKZh3fqzItbjY/HZoC7rSgBFZtSXLXHT43vpQijw45igGcr
ttETLesdItM71OALgTrQZFeT6iRvHuvCxf3qh/epWRj0NFzpYgnz8BazeMNtQbR8ssROZbWKR87o
15YZyBhn3TdrcdXTxiG301jO6F17OVOXbtwtLf/HsOxqdGQndiQrVmhrToWLKALJWFW4OYpBIz+g
qw==
--000000000000d9dcb605f14c1a9b--
