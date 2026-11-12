Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489554;
	b=bbDHdqmumQMV31zWcCiVoh+fTQsVj4TJFNIoLMhUCjBJ1SnG/6GbG1yCPd8A5mmO6UGK
	 GTYtxBcHhUgepxzKVtw1uFTmFN6jBbAh00sef3rhGBUgmXNgAxOrFV6Td65ZSm3lctjIT
	 yPYvvjz24kUhRRWViBEwaIDfzswQbJNdxq7amyFZLqlAF1Z2Lk2axOGwAHkKWMC8Ad2hn
	 6G7NL3LDhwUnaPavUZUV8Fy/kU1LTHml361P142PMJ7cVkl+xmnXcoGS5xao3m93FWapk
	 xKS/tNzOeDJlgL8fAB0zUfHehOSg2koq8f9AkNyxl5pyYb/yT5jlwxugtLSzEjNp3iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=julUOSEjDiDgpHclwVpxKxva8WelCXDy++4zkBQahkM=;
	b=dxkmC4E5zm6ZFmTp+S61gPv3KaQA8tkwid4hb+pnKU/4BVBs+vfdJfktrmspq7S4CbB+
	 CGogEB0pbtd01YmNFIJFzU5jcoMVOnW/zKSYoqXYI3QTJ3JMz/I+Gbo7EUj8R1vZo8CIa
	 sa17fxyZXNaVrYzOmrfuKUr8ebtgfmpup4A/lp7vIaOwThZZjDeN8ldm8lRUKrC/PdlxZ
	 KwuHqp9rccboBTRsU2e+UL4DfNF+KXOnK8miqLJreGUPu1YaiePhHPwR7RxN4+U3cVjvD
	 Bz5msTlSLOlON3Fhg5F6CmcnNSqK26FQVI0q9vuc+46Dj88cWgOKbg1to6d23izf8CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HguDbWEy;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722F6606A321
	for <asahi@lists.linux.dev>; Thu, 12 Nov 2026 13:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 722F6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HguDbWEy
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so669818166b.2
        for <asahi@lists.linux.dev>; Thu, 12 Nov 2026 05:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794489553; x=1795094353; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=julUOSEjDiDgpHclwVpxKxva8WelCXDy++4zkBQahkM=;
        b=HguDbWEy47TqKOw2jDZeOtrYY9hq1u4jXl2QHOA4+2vd3YTMfxns/KikA6VLz0f0Lv
         RNO54VlKT1apFnaM9T6fcFXsd0U/hzsZPlcGB/tv5uDWGvBivFr9JIlVueOBfyOSaY+t
         F1+wgjxM0T0pItxVl7CJqRRWga6rUBBHMXhFuPHQECeuqLi7n0x8HQ5n/asqkHlmRlq8
         gogxwK991hzHiB2NfzQLFuqb7v2IVsWsCtjiH8nmfWJPJK+O27BJ/IoMd6ohWQ3izwR5
         nNz1koCZOyc/9N/eIJ3qorR05N+/krmVTUFLKYgcum/hm4Sm+lIDovIpk9oGBkHUtzdZ
         Mfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489553; x=1795094353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=julUOSEjDiDgpHclwVpxKxva8WelCXDy++4zkBQahkM=;
        b=ugNZjRMLj400VP3w+Awo9Spqiod/RzsNt28xUE/hV49006u2VwmBbfTGEQMPWs8vZF
         po5VhXKRa/felct68ojFyNn52SwirePJ0fJ0Hst78ELi0gQMdKzvzPkvmPEnZ45NeeS4
         kA0hkP1EXIqeVsIKlhQvis17/tXWDW84dssQOakDbM5OiopYqgWdgrCg1x3+3LTNg7rk
         CT07P/K15jtxqbEc6J9h/T42Wks0nCD81ys5zySTQ/RbaAslKeR1X7b0j7B64cukJm1M
         x5gyfw28LRxruuANdYQmg4yhmzRsQFN0HU/igSRGwVEvwqhJMoGovZGLM7FqdDNNzZ7R
         nOSA==
X-Forwarded-Encrypted: i=1; AL+hErGWTSOUGcRsvCL9ty7IbXzYeugTJB3mEZsowu7bA6KOl9sTpv21QM/A45RKCkKGjSQvS8YNTA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9asPZQX1yMeYQmM2yZWkPYdCM04ksIInzRxrg9xujx4ncLxBS2
	/Qc2iBO/SFDt/LWwtp4U1I4pQtdvNSSi2HU5H1gFawmVJo9ZN4AtwEd5
X-Gm-Gg: AYBFou3q4tIh9RX8kXS5MFiN6E/VmcpopI+R4Rx+rIlRDCtsS/5iWthmUv2rXrELc7Q
	iNEF/k6OAYDAzfuYl5oqUCK+6KwkuFBZN8ofoY7RPxzDcbHAlhA761fsYXbT+wF6rqjX+AjsAmQ
	oaBopf8d1e7rWTsv9NMAPWjeRMkEGf/ZEp9wbWQwd+5uGbRajcd8urDXfdVFQ/paz7TNNqpmzkB
	HC9Uh13uJJQz+vqI65rpHAICcG2ypt1bjd9n+6Y1CZIwWkVCx9TiMFJ54cRCGsac/cmlq0ToZDJ
	ss7HOPBk5+xMfEvoT4DKii1lGiZU0rYGhv0YQUJHvYgxMvLe3hggiNW1i7mw2f9ljq+DjSl8f4L
	7hy3lAnJSzAPQoGRy16zEffXdvPZ2f9uZKERdZX5AzYtFJ6OMq4TNBigXiC2a9K2ModsrkOGvea
	I2cqhcNYK1efZ0DCO/pj3DLs9NQmdz8SPnLa7ypH0MzoVSdcZ7Z4ikmZrY+GWLbIKuPVLQ25Tod
	Ne1X8dGZPQjwCdzzGX1htiTZl1B4OJ6fMFUQid3+SsMzqxpkPIzirYAAYQHW/0r5HUEhhUTIGdS
	s4EykapKclenHvFd3lB/OY6ShrniBLEcdAv7PwyT7nDOrlqA2cf9QAI=
X-Received: by 2002:a17:907:9811:b0:c46:8b51:c17c with SMTP id a640c23a62f3a-c5066a83305mr467351966b.17.1794489552581;
        Thu, 12 Nov 2026 05:19:12 -0800 (PST)
Received: from localhost.localdomain ([2a13:e746:396c:c600::31a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a3a6dc3sm350140366b.6.2026.11.12.05.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:19:12 -0800 (PST)
From: "Kordian Chmielewski (mlody1212)" <kudzo51@gmail.com>
To: dev@deq.rocks
Cc: arend.vanspriel@broadcom.com,
	asahi@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev,
	j@jannau.net,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	marcan@marcan.st,
	michael.reeves077@gmail.com,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH wireless-next] wifi: brcmfmac: msgbuf: count tx status only for the current flowring
Date: Thu, 12 Nov 2026 14:18:59 +0100
Message-ID: <20261112131859.339060-1-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111195559.160650-1-kudzo51@gmail.com>
References: <20261111195559.160650-1-kudzo51@gmail.com>
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

Hi Andre,

I have now run it on a BCM43684 (firmware 17.10.188.75) as an access
point, with the logic of your 4/4 and this patch ported to my tree (its
tx status path is the BCA one, with the flowid and generation kept per
pktid), plus counters for the test. The AP sent a client a 150 Mbit/s
UDP stream while the client was deauthenticated 60 times.

In 62 flowring deletes, 2130 frames were out when the delete request was
sent. The tx status of every one of them came before the delete
response, none came after it, and outstanding_tx never went below zero.
Here too the host saw every status before the delete response, as in
your BCM4377 trace, and the generation check did not trigger.

To see the case itself, I then held back the tx status of a flowring
being deleted for 3 s in the driver, so the host handled the delete
response first and the new flowring of the reconnected client got the
same flowid. With the generation check, all 531 such statuses came for
a reused flowid and left its counter alone: at each of the 15 deletes it
matched the frames still out. With the generation check turned off, the
counter of the new flowring was wrong at 14 of 15 deletes, by 787 frames
in total, and went below zero.

One wording fix in the patch: "This happens whatever order the firmware
sends the two messages in" is too strong, it should say "This can
happen". Without holding a status back I have not seen it.

Kordian
