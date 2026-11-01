Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793561248;
	b=4P+qz2sK7O/lKXWt2zKzFjqvcIZ1k8h0ksiBY7qLzyzLh75Uxplc6KW3X5MssvKqs+sJ
	 iaKxNii0lK+NkglcFOO1cxB1dPH6cmtcVpb37uO+g/d5AsL75MA06EqVQXJeG78ToZ/qV
	 qgYmBqHQhAL+DOUWe/wa7kEVPoDFT0/DY+Bm2CYWnSSbIY40Vv6L6MxZ2zOnxcph7YzR9
	 0P0S+DHNXKQPnUvP8ZBPHAr2PAOoja3n3s0hgzlKxAG/L0S1my4scsMY1ChVO7ecg98iJ
	 xsqPkvNIjw+WROMf4hyQmMOjUcwIaQ2XkjvmgP08iAPnQhhxGDoLfScZ05Bxn+etDPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793561248;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=FBzaqWRuYJDOcynWW1oUqzv1XeYY64zxgMqREXlXnBE=;
	b=LgufBKhxxeMs3PyAOj68k+Aapfg5VBiP1qzSeGpl1AQW+M7CzEoiD91bi5mLkAky6FG/
	 X3Hip6Da0T9OTzBnQctQu0iIDTNEWFIAtvk5BxGQgUZSQ1lLWndsSMmfctzQ+6ZyCRKf7
	 cEc/d6MDrjb/FnFgeDG0AaaRM0aPN8IUr7eXmX6qhN2LJ/K+ID5scJTw9PobJ/GBJfl23
	 4z6I127IlRXIpWjYaE/INuYuaCCDvnAMg7O5/Z7VDcCbTOsJ/DEDfJIP728yyhu/nAQxz
	 ksFOMsOvx0uWDBP+3SU3ea0zHcftNlUSQPMFYv9ZxFPGPu3ndoexzUnW9Jx5QEUTPzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=IKkv0k6d;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560DE606A32D
	for <asahi@lists.linux.dev>; Sun,  1 Nov 2026 19:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 560DE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=IKkv0k6d
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso1330650a12.2
        for <asahi@lists.linux.dev>; Sun, 01 Nov 2026 11:27:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561248; x=1794166048;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FBzaqWRuYJDOcynWW1oUqzv1XeYY64zxgMqREXlXnBE=;
        b=N1vp2JuOFGvS+GRBVSixFdTCVqk7RvFm00G0YELKfIgc7sbkGrVe18NQ59uVOYBzjo
         zMa0TNlUl+C4cGk2DEf856iiOIs79AelSiTuj/ntPGjKHCR9kvYffSK+MsKJbqMZumBM
         MB2pxH+UwRRSSqFJR5wUYg+7f4DCIPPkMD5i+hUlmpFNetylckFjm137FrjcFvNWkKdS
         GxxdcZgeTYGHAJWmJ6ib8fzevEUi27eGVHp+G+xu81s6aq5uW5jd91c/YggmUadsat4a
         0X3ZLi6kyx5CKOY2kHbRHDwXtRqrtfMb5AUsplGhLLnrwzQ/WQgENH/b4rEYxgjkxQeV
         fqSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgcGD5PV38XhrIGboCEyYt3jtWXTGgYKtQa6bYAq8I7k9xH9Maw3Pt7MzQTC6Bei+plURs+g==@lists.linux.dev
X-Gm-Message-State: APuU4Z8RLyzaS0dBOM+jyv2JzQsG+5I9cPT+Jw0WZ36Txxgzp4Bpj3If
	0DSqT6H6JwhCBbQfn1dw82qI7HuEm7UO9xxPH+B0A2VmSntJb/JW84gyg2kZUX6TWK6wNPLWmQg
	01VzJPA/Verq6Kx9QvBH1/50XSuPk9ysTYKvQRPRXcsN+QIEBsjlKuCY74Is+tYirnn+imd3zfA
	L/dBx4AwRfApSjMteXzdtRyS4hMv3DF9avkKI0lmrOYGFnEkZcCwJ3CwooxS9iIjkpwcPR7CfeV
	j7PuvXhlrcCUGIT
X-Gm-Gg: AYBFou2Kz2s/sfFntGX6V8mS5nWPWy2ZywBYSl8tAKsFq0yIvTYwkE3Ss4asxgi+vJw
	Vc+nRL2hp3Pt6tNGEzaGO/Md8dGECjkJPBUPIpN5Jtfzo3EqSwf52umY5eOCmD3dsEaDCAzcN+W
	FX0RAOpZDC1U541ksV4b6Tp6ZNDzA0n16YvmL54LLK89Zzbm6cuBPFu1dyy00Oc2x9GEbFZLyvB
	SyFmLcYveEcrIguV3tniq4c9SD/+anjzeOMJO0ysrx1ivPcGpSg39D0vjL4ruMjNF/DtU2IKOo3
	PIRE99QEFYJKuCvCPbVImZt8xyA5UlBez7vmjR9FZqgS1qYhpDN74Z5vSVQtT+CjawcEy4Egkyk
	C+UocjvlGR+ryAu7QgDMqVc6rhTDmKlzAGf9kBOrksfcwCbAPcSY6s2Q5G73PX89VTdaMd6DHHz
	S8TJoVdemCMITUv7Em1FSlibHKJ5xMRcN5HL6yVAA=
X-Received: by 2002:a17:90b:5868:b0:39e:6c68:c77a with SMTP id 98e67ed59e1d1-3ae8984b11bmr6879494a91.48.1793561247693;
        Sun, 01 Nov 2026 11:27:27 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e80415bsm8589907a91.3.2026.11.01.11.27.25
        for <asahi@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Nov 2026 11:27:27 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c414c206673so119245166b.0
        for <asahi@lists.linux.dev>; Sun, 01 Nov 2026 11:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793561244; x=1794166044; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FBzaqWRuYJDOcynWW1oUqzv1XeYY64zxgMqREXlXnBE=;
        b=IKkv0k6dLyQrspRl+xKlhsrAkqHPAWO4utOQGPf0toYwECoz401QNuZOC6WwGLQgr1
         UCsGcg+ZRRb7ortV6nWnr1oTq3KTmHI6lg+ObWlsaIwyw0KXgb0yJa7Z3kghMFokeZ40
         3dCyIlfropEHibOGs57HQSgW+hMUDngBgB6tM=
X-Forwarded-Encrypted: i=1; AKwUvBzQvket87KT003Xt8IqHt/PjtfZoD1m9EBKAX8jL1KfSqgEcC+PhsuJGicbvvo/ZrdGzxWDHA==@lists.linux.dev
X-Received: by 2002:a17:907:86a4:b0:c46:9d7b:37d with SMTP id a640c23a62f3a-c4ca7a4b544mr641619766b.17.1793561244356;
        Sun, 01 Nov 2026 11:27:24 -0800 (PST)
X-Received: by 2002:a17:907:86a4:b0:c46:9d7b:37d with SMTP id a640c23a62f3a-c4ca7a4b544mr641618066b.17.1793561243910;
        Sun, 01 Nov 2026 11:27:23 -0800 (PST)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc1920csm303460866b.5.2026.11.01.11.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 11:27:22 -0800 (PST)
Message-ID: <d78cbbd2-601a-4cf1-800f-3be57a2b7de2@broadcom.com>
Date: Sun, 1 Nov 2026 20:27:22 +0100
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
To: michael.reeves077@gmail.com, Pieter-Paul Giesberts
 <pieterpg@broadcom.com>, "Franky Lin (Zhenhui)" <frankyl@broadcom.com>,
 Mathy Vanhoef <vanhoefm@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, asahi@lists.linux.dev,
 Hector Martin <marcan@marcan.st>, Daniel Berlin <dberlin@dberlin.org>,
 Janne Grunau <j@jannau.net>, linux-kernel@vger.kernel.org,
 Hante Meuleman <meuleman@broadcom.com>, linux-hardening@vger.kernel.org,
 Peter Robinson <pbrobinson@gmail.com>,
 Izabela Bakollari <ibakolla@redhat.com>
References: <20260925-brcm4388-submit-v1-0-b5cbc2cde2fb@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260925-brcm4388-submit-v1-0-b5cbc2cde2fb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

+ Peter, Izabela

On 25/09/2026 15:43, Michael Reeves via B4 Relay wrote:
> The Broadcom BCM4388 chipset requires new PCIe initialization and
> firmware interfaces. Add support for these interfaces to brcmfmac to
> enable basic station operation.
> 
> This series adds:
> - Signed firmware loading and mailbox transport
> - Fixes for chip identification and firmware capability matching
> - Versioned scan and join requests, and extended PMK payloads
> - Updated event mask handling
> 
> These changes include work by Hector Martin and Daniel Berlin from Asahi
> Linux, refactored where needed for upstream inclusion.
> 
> The series provides basic station support only. 6 GHz support is planned
> for a follow-up patchset after this lands. The driver retains legacy
> interfaces for older firmware.
> 
> Tested on an Apple M3 MacBook Air (J613):
> - Device boot and network scanning
> - 5 GHz WPA2-PSK association and DHCP
> - Bidirectional TCP traffic

Finally got some time to get this series tested on my setup. The patches 
generally look good. So far no regressions observed. It would be good if 
some more people could test this series on their equipment. I will do 
some more testing and wait some days.

Regards,
Arend
