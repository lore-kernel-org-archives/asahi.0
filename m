Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714372;
	b=CWdvFSOz8YdZrhFOYN+pc8Ep1NkeQGx8XiIf7uWlZV3XbqghtQBLQN7N0aYE4QODmNPa
	 6mDKcw+uw3liM0iyfJYZSDjs5Ha74o8kMO1nDv1Jpum4kQUHD06xA+eQO0jj+6Nb7UFti
	 jJa3b3jUeKL3yXff5M5weZ6gDYvZZHrdCEfT9zeFYkknj8innA/yX0UOClb1IuSiRF5QS
	 E+EWSDqz2bSK4348cOHVLtYVkAaLi+KnE/FNGRTEHBLhk6LjAzqKcaIxHh4cKDBTvaGAv
	 E38B7/ICUaheXcfX1tvgjgErkgH7LZ4sDQK3sbm+a3tFaeVO/8Oq31M7FbZ9eLuV0HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714372;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Qngkg57Ni1YhWMlAtKTzwfofY3KWH3EsG38ilqqk6Gk=;
	b=uXR99bfrNbWHNkhho8rwOaRY+V+rq7xx//pfEZt+SuE+207iWo18Oq5m+/F/h3jXK0rP
	 ilIszX59RZ5euOTI91kGq9mcYMTF39lG+0xidRiQ2i5R29wcH4aFPIhCAGUhYEOg5Z4Qm
	 QIBtweK5cnQRiAkNs1pa+E7Vr1eTZZi25YmfHPwo4bA3NiT7WkE+Up7SgdJXsYmFagKdz
	 IMmsNjBwB7zphaHruQV9i2qNlqCoJqtVqyug94PA1w92mpQiJLH1EWurpwEGh9nfBYpwg
	 DS0MZ5ordqx2KBF+RxmHoPfQ0LXBGfq6UHcUUHG7alDT+Baogl4nhRAsWvBXQUBMwZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=cSqw3bTN;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5534606EE91
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 13:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5534606EE91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=cSqw3bTN
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ada8bc2380so1923859a91.3
        for <asahi@lists.linux.dev>; Tue, 03 Nov 2026 05:59:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714371; x=1794319171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qngkg57Ni1YhWMlAtKTzwfofY3KWH3EsG38ilqqk6Gk=;
        b=yFmSvoBuERzHED4UEOw1fsT8qzDSvdaUz3jdRP/OR41J3iq65oFCPmm4SdCfQBwoJB
         JWAeCWRtBP92yop7giYNCcZa81q2uQMNcVobkfM6n784vo0vufWTEM5VzUaQYkVz6qAP
         RLgxRPIushW57IBNcmQKhSMwgUzUdnv4zBD8mJE2unNv1m7788NgMfMIxmNXVgSiPQGr
         w4jInG5PE3a+IdpSVyB2lgY+/C5UI7/qvBm917frpClJwPj2uZm/WLyrKY9WhDZaVQIo
         gPX/nnTsdaNTv3j7H6QuJ1zMbWjF5Zm4p98XoI+1GoLrMlQqEQOygXdFc8alVVKqNcoz
         Lctw==
X-Forwarded-Encrypted: i=1; AKwUvBxN9lyf3Qnqdxq2TfChi+TcTIRSQ43UHpTKy0+4eOEPdf0AXn6rei7lbWO2WQTUVIMfa+lZXQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8ymhv9yeFv73RlcZoXzgRdqAgZGKC1kav286nHvbJWsKLsg2CM
	eFxkDn3nm+QSD6vxzChy4Jx7z98evdRvqBn1EkTeg/IXhG2hEd09/nTNaZ0gmeMIZxYh6WJi1So
	C+XP40pkAWB30FXIH4iP2N6E3fg6DWYWrblDqXI2KLSgFbDbzd5VVZOnKQUqVX53abwQ2Q4h54p
	dkKDWYzlF/CEaHGDjQzk7XioNNS64f2fd0RYfZGQnsApfj7DgJJCG52xjhorauY7UfRUAI7MDjv
	XnDaG/cVr7kUw==
X-Gm-Gg: AYBFou1H7MorEl9YKRwZbTo13zqt0PSYekYuShTcS/Ja57rPyS1xTCIlvHarPvrCcc/
	WCrY/TEhGOw6vgwMomW1wuxvyaFqWmRltrDitGBgBeQDm7680p4pnOwEC9Q+ckMbZiV58AfiBkF
	GDW8r08EbDwU0MneFyWuA8XPD0icqroH/gdBMpbOEfestcGRE1NgnxXvJJDI9whlVAOGWDbpX5J
	t9+GITx0ZMXRMvwinF+imB7pKqtMzFBfoVreOL2FhQFDkDk/0kW3XltZz4wRb8yxudxqGDX4tBw
	KL9mk+H+SSc3FFyRViiLAD3yp8qjMVhnEVANRVLx9lapdz4Rh3L3U5lyJV5Goot5imXsAq8vb+8
	qGRVKtkeop2/foWNDLFLLwFhdM3hK920ZADFkYAn4lHbfMOdA0FLMove7Wz59gYmVRMjOqgLkDM
	+MMXgYasPKAhF5gMpGQkHSHP0/mPtfxPvjIUnp2OE=
X-Received: by 2002:a17:90a:ec8d:b0:3ac:b7b9:6484 with SMTP id 98e67ed59e1d1-3ae897ae130mr9804929a91.45.1793714370968;
        Tue, 03 Nov 2026 05:59:30 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b07ca31151sm1882491a91.6.2026.11.03.05.59.30
        for <asahi@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:30 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a71dd190b0so2263230c88.1
        for <asahi@lists.linux.dev>; Tue, 03 Nov 2026 05:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714369; x=1794319169; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qngkg57Ni1YhWMlAtKTzwfofY3KWH3EsG38ilqqk6Gk=;
        b=cSqw3bTNY8FABaEUNDyEic85ebVpd0KT/VcE36zpdqYd+ya4jjM9xq5feT4unZsoKS
         RE0bkd/hh/F9azif1CcljaY2jhE2OKovovkP21mV+d4L0wHQZQ+wxet5Dbycgj5q2iCu
         6723XkbKxRcz/VASrxPjE8xh3HF+7zoHF4dIU=
X-Forwarded-Encrypted: i=1; AKwUvBxz2ccV03Ua6Xtq5nRJncP2O18ia48bYHwg7UjJMQUt3ddpol3Y+Qm7pe3eqYkLCjnX5/LDPA==@lists.linux.dev
X-Received: by 2002:a05:7022:ec85:b0:15a:2b63:a0cb with SMTP id a92af1059eb24-1ac59dd081cmr26545022c88.13.1793714368774;
        Tue, 03 Nov 2026 05:59:28 -0800 (PST)
X-Received: by 2002:a05:7022:ec85:b0:15a:2b63:a0cb with SMTP id a92af1059eb24-1ac59dd081cmr26544986c88.13.1793714368146;
        Tue, 03 Nov 2026 05:59:28 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:27 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Michael Reeves <michael.reeves077@gmail.com>
Cc: Pieter-Paul Giesberts <pieterpg@broadcom.com>,
	"Franky Lin (Zhenhui)" <frankyl@broadcom.com>,
	Mathy Vanhoef <vanhoefm@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	asahi@lists.linux.dev,
	Hector Martin <marcan@marcan.st>,
	Daniel Berlin <dberlin@dberlin.org>,
	Janne Grunau <j@jannau.net>,
	linux-kernel@vger.kernel.org,
	Hante Meuleman <meuleman@broadcom.com>,
	linux-hardening@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH 09/13] wifi: brcmfmac: Accept newer BSS information versions
Date: Tue,  3 Nov 2026 14:58:49 +0100
Message-ID: <20261103135856.3676311-6-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-9-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-9-b5cbc2cde2fb@gmail.com>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Fri, 25 Sep 2026 23:43:44 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Hector Martin <marcan@marcan.st>
>
> The driver accepts only BSS information version 109, rejecting scan
> results with newer versions even though the common fields used for
> reporting remain compatible.
>
> Accept versions 109 through 112 when reporting scan results.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c   | 5 +++--
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h | 3 ++-
>  2 files changed, 5 insertions(+), 3 deletions(-)
