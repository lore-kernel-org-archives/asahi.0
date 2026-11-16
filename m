Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826401;
	b=U2HNcpFYrtUXSriPrp2HDC7D6V5rEbbsPBEmM9/Ln3EzHfjVrgxcTzIin4IN1ekKDXTE
	 KJGgV3bsFhbnPFVeRrRaECR1Jfwq+bLsiLFHiqFqNWC7FAy7Jrw61QE3BQyRzT0p5sGKp
	 H07OgEDfqa/tlMlL59UT1EzFtaZxBeBBamLn6ZxSv/sxlhBaO3NA32CkOan2KoNvoYG9P
	 KYZpa25jp6B9tsUFgoBG209uT+ieGEDxWnvNww+lqdsksC/CR0/UVFf69c7Ypw4Wyd823
	 9NUV0Ts6MMbbNpxKRDpJ8qtgg2IQrA90gSI2Il/zSzmEJSvfoJ0cdxWbTsF5nsNJP/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826401;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=HVQaD9JPLSlypPeoMjV3YW5/MfO3VO8SRm2wJMatWzY=;
	b=RGmHb/jlxowe2Mkm/Tw6C0mXt9VIZKW73XjPyCQGr1bxB6sHtAGGHE11gvkYZh1C5vPN
	 4/V4rlADr+O6Zh2P0N3GolO3gqtfMyt6JnjxSttLbTsSBTLrcVNA136tXLjbIiTbg94u4
	 zAtC6dMQoBJVh8HCWnVsP1QoufCpSsyEb8td2oOeN6jGc6mF2CtYDGx4ohawPvH13xtY4
	 a01AZeDFvuuzUNGO6c4QANn8/ZqfL+kg7o7EZCnpSlU5HHQXCnsuSlhPiR/8eWz+3ALhM
	 HUurpAGe3iCMtTELdE9sG/p9snSPRYIwNzK7v8o/yFgKKULESJgPc5Uthprl1R3yyXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=emtwnsho;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F80D606A8AB
	for <asahi@lists.linux.dev>; Mon, 16 Nov 2026 10:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F80D606A8AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=emtwnsho
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso2281326a12.2
        for <asahi@lists.linux.dev>; Mon, 16 Nov 2026 02:53:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826400; x=1795431200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HVQaD9JPLSlypPeoMjV3YW5/MfO3VO8SRm2wJMatWzY=;
        b=Phi0cO4YDVDLCqi0DJBlcgbGS+m0WPDdoA+QUSYh+RbVK3wndv+9HnjgzO3mm8q/JI
         mhCFmWOFHqH/x2h6rvY1IG2OA/PgHbhxj6LXr0DKOZiuSa86XToKY5WWNKLOYW2eu7Fy
         nDZLb9T4JfgsEDOZ2Sjg10Tm6X09TsTBbySkTOXKk/j4yAny5jK260mJweL3PyVQBpBa
         r2yJkRY2TD7LD4SGdP7JKh1tXax7JtLFm9IShJXUGzxCXCchOizu4VA8cZTcIkFLuR8G
         yQcTMZCsqaWoLbF6bTG3wxxc6nf2BiPPip/kbqJeee7ZyroQ67Vu3tAozb9mgW6AQtL0
         6WaA==
X-Forwarded-Encrypted: i=1; AL+hErFv22Z/nTrbMDBWLaxw5df2HR7CdwYtwdDAa2ryZeJ2t6vG5lF+9KodU1HTimyUkQvdL97qkw==@lists.linux.dev
X-Gm-Message-State: APuU4Z95Gh+95NMBm+f9voV02Tm5DyLgZqXFWqvfLtLA/g+M0udR7F6/
	AxTjcKTqnXDRF6ODTUfS4f/08m95zpfAs5qmDXycPXCh++co8yN5TXhayP66gwe+uzulSBHoNrd
	5Q1K8dMaB4EYey8vS5M3s5e+7RVTQYuvgZR+FGseQiTMKmFA8nZ3nHQn3Piok20yxDcupflFp51
	nsb5Z83+kZRbJA5qgOoFO9btBwNwnYUXLW2m5vOKk5FqnUVa+iQQIkIR0fs2spJYy2ccvJSHZV+
	4ngZKaCX/wFrA==
X-Gm-Gg: AZFdTZcsNL9SEGSBViE3WE3Qgftm9FN3VxUGkwvghdjwRhvJXOXojZ/woU7f5zmDgDU
	Pwg5brm73iAcMZt7tLqQ1AbmYt7WKVOPgVnkoONnmXDrPAdJodiCeHfXFzrBf+g4o3dWrjm1dQa
	C5I9zE0nNZPqpwdwUXKwXGeQ7gHeviLwRUU4qjdmpFfiXARff1Bvy3R10JwJxqt2smGsyax5s/2
	dWyvU2RUSoWW8FSGzYCkaFEceeS4iiSur48Z6Ea5x0FWo06PrBR17JNMktjNmitCVJM++64ndwO
	MmzvJ7gBBcrfwguVR1oQYaAq82+jbHAV1KQwT+lGsk4zi2gUBmy2Tu4e/tgA95GjE9RYttid8yd
	lNMiyQ8p4EkZkg/+7Ff0kV1qnWLdM9HclG7lYfBEPgIOORGzSNZ67ONDfynd9Spv+kuAURfFZQ0
	tCII/SxNMFTzmA+xTCPdKmlnGXKM4TfK8p2FVecbA=
X-Received: by 2002:a17:90b:4e8c:b0:3ac:9d14:fe9f with SMTP id 98e67ed59e1d1-3b1b0ba3320mr9931914a91.31.1794826399784;
        Mon, 16 Nov 2026 02:53:19 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3c0a5a8sm5347582a91.2.2026.11.16.02.53.19
        for <asahi@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:53:19 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495a1f5e47so177039885a.1
        for <asahi@lists.linux.dev>; Mon, 16 Nov 2026 02:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794826398; x=1795431198; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HVQaD9JPLSlypPeoMjV3YW5/MfO3VO8SRm2wJMatWzY=;
        b=emtwnshomaV0+2afLmAaDDufwbbmXoDrL5bswFU66mByjMC8O8JBYGCeL4cvXUZY5d
         6Nv8wTFWVN2fmXrZWySxX+iZVl9fnTxEgmOstOd35ezfgQ7TBlws6djX1YrPJdgDJmbD
         IzE8Y/chTywPe4+jooiHjYjSqOCkFAHh4bwmo=
X-Forwarded-Encrypted: i=1; AL+hErFf8KG2C8ZWvQRntDvVPFBsIaNlVViTLYKINaPorB2H+BN7NfgrgFc3TMt2X+RVoOYhDoDR4Q==@lists.linux.dev
X-Received: by 2002:a05:620a:4541:b0:945:afc1:a73e with SMTP id af79cd13be357-9494ba601efmr1588959585a.8.1794826398318;
        Mon, 16 Nov 2026 02:53:18 -0800 (PST)
X-Received: by 2002:a05:620a:4541:b0:945:afc1:a73e with SMTP id af79cd13be357-9494ba601efmr1588957785a.8.1794826397898;
        Mon, 16 Nov 2026 02:53:17 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949825e08b4sm125151785a.37.2026.11.16.02.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:53:17 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Kordian Chmielewski <kudzo51@gmail.com>
Cc: dev@deq.rocks,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	asahi@lists.linux.dev,
	j@jannau.net,
	marcan@marcan.st,
	sebastian.reichel@collabora.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next v2] wifi: brcmfmac: msgbuf: count tx status only for the current flowring
Date: Mon, 16 Nov 2026 11:53:13 +0100
Message-ID: <20261116105313.3479803-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112175754.396469-1-kudzo51@gmail.com>
References: <20261112175754.396469-1-kudzo51@gmail.com>
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

On Thu, 12 Nov 2026 18:57:54 +0100, Kordian Chmielewski wrote:
> brcmf_msgbuf_delete_flowring() waits for the outstanding_tx counter of a
> flowring to reach zero before it sends the delete. When the wait times
> out, it sets the counter to zero with packets still out. Their tx status
> still comes and takes the counter below zero, and since the counter
> lives in the commonring of the flowid and nothing resets it, the next
> flowring that gets the flowid starts from there. With the counter below
> zero, the next delete of that flowring waits until it times out as well.

[...]

> Reset the counter when a flowring is created. Give each flowid a
> generation that goes up when the flowid is released, and keep it in the
> tx pktid of every packet posted to the flowring. A tx status of an older
> generation still releases its packet, but no longer touches the counter.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Kordian Chmielewski <kudzo51@gmail.com>
> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/msgbuf.c  | 36 +++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
