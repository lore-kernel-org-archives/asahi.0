Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713868;
	b=ZZI3hyqUBnuPYX1yzno1Jx2XGztGH37YbzCQs7I1iM8O/LGuai8OLf3VJ0h5J6o/b7oz
	 9frfPRWqI9i1ynwuKaP/zutoNBnM8XAog31oqMIH1Nv/T0VepQU+O2oK4pPRSK/TM+F4j
	 +ez9DDV8QtuxQyJKjONpCn2y71oslwhKagfmam1qgpMC/yh7iR8Er3ZSp2u4IzT5UI3kE
	 /dzxNRifue4gqJHSiWMq6AKiXip669r1K5LCqna44B7aQZq84oy7wPSnBEEmG13egPov6
	 8QX54vdhB8u1jEAKZeYnBjHVjjI4wLRuSjZGHtJ7qyYRpVvmi95EEyHXK5eml90tR4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713868;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=kAZHHRNJQTBE7m/Mdeu3wvd8YYTG4G1JA7sRIt/FlQI=;
	b=tRMQULo4x9c0IB1pOCikvRXRuLEdHCyfLAV2yC1XpG63neXZ6Ub+8mr+f/Qzx1OZUbvv
	 Xpkymzdjh4N5sImJAqesDD+5DBZDEZWD9Qpw15Qr1iwwfi1MY3CGpRTPncWU7xlp1aarz
	 vie4uzKFO2EM6WnO3WhNoJ5Ym4f5eAXZlWkn5/aLk4UxEB+f73UR8lM86Hcu2Yv3pRZfG
	 Z1WsIkD5bgFXfmk9GlOk/mCns0Lme/E18nEHBlDTBydPJpYCa3ojDKSe+bJao+BVtRi/d
	 QQhAFKNUyW4VNteoRSFE8Y1Vt/makRTMAfjLGEdkOjkZdea3sltF1izsW0dZ/sVEOpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=TiRriM4n;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C2C6082BFE
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 13:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98C2C6082BFE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=TiRriM4n
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso261901a91.3
        for <asahi@lists.linux.dev>; Tue, 03 Nov 2026 05:51:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713867; x=1794318667;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kAZHHRNJQTBE7m/Mdeu3wvd8YYTG4G1JA7sRIt/FlQI=;
        b=qrdaVboIAXxGvRS2vP/DtW17SwoZz3HDCLniXa9Zsfam0Ubg5GCiNq+zX64BuZPVmS
         fG+0nzt4oTo+pYVefsk+q3SueNCO/cjEAC7xa5UUmu1FBUPhvCtjzhpNuZfPThfutRsr
         +Hwdh1LCTwIkQrQlv8Ag4mc4g4kt/MGh+b0xFoIcvcCxhyfNj4YX2/NSZRwwnA21GL39
         BDIMZTICtIaJanGkuN0PSnxt5+yhJKS1HhhH5mzCyDCfgxKq4XXSHZLtV3aSnA3lpbOO
         z8kxbqnMAbDOpJn08z1tFpq4QHqZ+FCq/AS4fjdOoTMm0bP+iwcy07kwpzUr2AmMaw1Y
         g9Bw==
X-Forwarded-Encrypted: i=1; AKwUvByLPS9+9VoR67eow4+nbXdY+052CZYR7PogF7C/PfHNo/NL0XlcOJi4TM91ufMQVFi495FCTQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9FnCGAbes/skZqvDqhb+c9luvRQPhtLB1XHn7g3pT2fxdXPKRR
	RDhoCyNvovSLdp/mr3wA14RMBA6603dv1B1EIXrXqwzEP5/0TZTGOHHBiwbX8YQV/laayaxY7Ym
	cxzDc4yEmCf9tQod680hPkFNfJXs3ndc5kw7dZB5lsNFBkgMgom7xPnk7Q8Vd1pl7CWIrHoafJE
	zW4a9yExdcuJpQmZx1KPo9vFukGr63WBLAmm3+Ybe1qXtvonmsHGwAVlKtKLCnIlSEtZahTJktm
	exGHYwc+Yd1XQxC
X-Gm-Gg: AYBFou1K4f+92wMbZfndAR8N6yreh1Yy6sOWt4IMHs7QrMma4vfYJOKgCWRFkRm+jlO
	NCIbo74TDmQoqB3BirDbBgg5EXVqgy2Cj1ROCkXTWFsrCaC6HOXx3cJfi3UhpM+y0t9tHUHlI3N
	4p+C93WfCik8svVgJMVg98NT1cC1sOmR3b5VsBKKVxEIZqWSamNvJHnYM150lenBinC/K7gDav4
	Zmtqa88+klRmzTFvXagnG7uN+XHf5dZ8Qm7HB2d+ilgb1+qlEtUB3N2vM11lev80ZkYMiAd4wvD
	buGHF5rHcfeJgKi3//fAxt2xnF9SP+k+FbkFgQOBOHt+zrJj2AGrXTYiApT9e8lhJaLuXgAJq8h
	0FJCkObkfY3wRrIRf2aQ74sapJsYgj8tGiP6cYPMBb0C99tl+rkqw9TI59CHWPgmtmbeQrPHxOM
	Hq0iIbeys7Qf+jN698jXyrbONgmjBsw60GxGGeebg=
X-Received: by 2002:a17:90b:17d2:b0:3a8:699f:959d with SMTP id 98e67ed59e1d1-3ae89812800mr11000249a91.31.1793713866855;
        Tue, 03 Nov 2026 05:51:06 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b0872a3207sm869345a91.8.2026.11.03.05.51.06
        for <asahi@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:51:06 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5363fa3d3e4so83067211cf.0
        for <asahi@lists.linux.dev>; Tue, 03 Nov 2026 05:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793713865; x=1794318665; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kAZHHRNJQTBE7m/Mdeu3wvd8YYTG4G1JA7sRIt/FlQI=;
        b=TiRriM4njZ8oJhLb10sIsROEzDIGQIGSHtMaIhNLn47vVKJ2DWzDb/OotsIr1w6vO1
         OCWufmJMfMZWaPfIAxiNhEtVEeec0zd81HdEcyynhi+Np6L3f0RqYNes6p7CNr8EgNVS
         cCfA1asM0KYjOe4YSmgo0NHHRvf24Zy8TW3zQ=
X-Forwarded-Encrypted: i=1; AKwUvBwBYcYwiSDlVK/T+0bvUxNobRZxLUMd2WkSIvWRAqZd6fBqqVzKfch5xhnHInkYEPDAmjHPAg==@lists.linux.dev
X-Received: by 2002:ac8:5a4a:0:b0:535:84e3:ceef with SMTP id d75a77b69052e-542b781c626mr217069851cf.45.1793713865355;
        Tue, 03 Nov 2026 05:51:05 -0800 (PST)
X-Received: by 2002:ac8:5a4a:0:b0:535:84e3:ceef with SMTP id d75a77b69052e-542b781c626mr217069361cf.45.1793713864762;
        Tue, 03 Nov 2026 05:51:04 -0800 (PST)
Received: from [10.176.3.155] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e77e5efc3sm870636d6.39.2026.11.03.05.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:51:03 -0800 (PST)
Message-ID: <533b31e4-c837-494d-a4ce-a728bfbe07b2@broadcom.com>
Date: Tue, 3 Nov 2026 14:51:00 +0100
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/13] wifi: brcmfmac: Add BCM4388 support
To: Janne Grunau <j@jannau.net>
Cc: michael.reeves077@gmail.com, Pieter-Paul Giesberts
 <pieterpg@broadcom.com>, "Franky Lin (Zhenhui)" <frankyl@broadcom.com>,
 Mathy Vanhoef <vanhoefm@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, asahi@lists.linux.dev,
 Hector Martin <marcan@marcan.st>, Daniel Berlin <dberlin@dberlin.org>,
 linux-kernel@vger.kernel.org, Hante Meuleman <meuleman@broadcom.com>,
 linux-hardening@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>,
 Izabela Bakollari <ibakolla@redhat.com>
References: <20260925-brcm4388-submit-v1-0-b5cbc2cde2fb@gmail.com>
 <d78cbbd2-601a-4cf1-800f-3be57a2b7de2@broadcom.com>
 <20261102204627.GB770347@robin.jannau.net>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20261102204627.GB770347@robin.jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 02/11/2026 21:46, Janne Grunau wrote:
> On Sun, Nov 01, 2026 at 08:27:22PM +0100, Arend van Spriel wrote:
>> + Peter, Izabela
>>
>> On 25/09/2026 15:43, Michael Reeves via B4 Relay wrote:
>>> The Broadcom BCM4388 chipset requires new PCIe initialization and
>>> firmware interfaces. Add support for these interfaces to brcmfmac to
>>> enable basic station operation.
>>>
>>> This series adds:
>>> - Signed firmware loading and mailbox transport
>>> - Fixes for chip identification and firmware capability matching
>>> - Versioned scan and join requests, and extended PMK payloads
>>> - Updated event mask handling
>>>
>>> These changes include work by Hector Martin and Daniel Berlin from Asahi
>>> Linux, refactored where needed for upstream inclusion.
>>>
>>> The series provides basic station support only. 6 GHz support is planned
>>> for a follow-up patchset after this lands. The driver retains legacy
>>> interfaces for older firmware.
>>>
>>> Tested on an Apple M3 MacBook Air (J613):
>>> - Device boot and network scanning
>>> - 5 GHz WPA2-PSK association and DHCP
>>> - Bidirectional TCP traffic
>>
>> Finally got some time to get this series tested on my setup. The patches
>> generally look good. So far no regressions observed. It would be good if
>> some more people could test this series on their equipment. I will do
>> some more testing and wait some days.
> 
> Tested series on top of v7.3 + commit 7ed5dce55fa8 ("wifi: brcmfmac: map
> msgbuf RX packet IDs bidirectional") in wireless/main with resolving the
> conflict by dropping the conflicting hunk of this series.
> 
> Tested on Mac mini (M1, BCM4378) and Macbook Pro 14-inch (M1 Max,
> BCM4387) without regressions (except for the resolved RX msgbuf
> mapping).
> 
> Tested-by: Janne Grunau <j@jannau.net>
No regressions seen on my 43664 and 43455 devices. So will process the 
patches now.

Regards,
Arend
