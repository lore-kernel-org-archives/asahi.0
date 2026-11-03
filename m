Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714357;
	b=PwQAqzApGMbU+h2SZjtOBM420wfPzpr8kvZXHUU6SyAh2fXs42qU+PZh321wPA6mWA4R
	 5ChlPtwxnM/scMY3Sisdx/MNIc8m5+Mp/9dxufmZTvvJ35e7QxaImzLh7LzS8E6NiEDvW
	 AW6WnlBXe8lyRtweTSlVaTyjejeEG4DmqHjsuoTcMW6teDqeb3GoRBPZLKrWaoL25wEe3
	 J1rvo760cjk1lnnxYvzSLO7SsA8QFM29leGjxSGzBJh4EFK1WQvPdAcrCiTwT5B+ZIewq
	 srXeR44Z/c5YdJU7fkUVx6FNgT3hx8nRyEyOOXG0xI1q/wtEjNGVitFZaNB1SoH97cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714357;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=cvUJ5Fu74/yRvPGwst9m0ry7+LODDEe2Sn2iPk6DIvU=;
	b=JhiPsRa/pTW1WeidDk6vRLso7knD6zrN2wGHxz76tjh8c3l9AEn6H74T5SQk+96LSyAD
	 wanqgGshlO5FIOlu7Nxjz8OwWfkZZZa9cc+LGjOtv4LxIYA4an0kvM/XUA5KahIsIFD9/
	 6V6A5OARXtmGb0lGeakdbX5PaJcIrF2KELyELaEcNXPbr8NEdqReLpLN/cNjxtWfoOaAT
	 Nxf+Mz9vLS+/aFDWmvNGWe07lud0hoQh92NK7m8TVARE1jRZ5Za4esWN3A9hIVHZJTcdH
	 UXAZ9m7WYV8mtNFnE55AZHuc7T/ByMHR9ZtETChYlFUWD4YqFbVGlrSXRmIHWW+6I/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WaYNYr7z;
	arc=none smtp.remote-ip=209.85.214.228
Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D62C606A331
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 13:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D62C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WaYNYr7z
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2e9cf928dc9so3630935ad.0
        for <asahi@lists.linux.dev>; Tue, 03 Nov 2026 05:59:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714356; x=1794319156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cvUJ5Fu74/yRvPGwst9m0ry7+LODDEe2Sn2iPk6DIvU=;
        b=1H87D4FOXFlwh2fhuffWGZG6MslHuoS8HXLZpGAsqn5hCioHyDx+xTExY1E+i1+S+K
         7oYTSJwn+MDmldLt+6Rft7X3q/gHi3dWCMNpQHVTLudqLJmUr67DMmJwnLtnQ5ts0Kyl
         ZKvcuQHC1by2fEWhZ6CQXIl9zdVuUpMvL5Kkbxi2C4w2vPwfVX08QpdugUvybTyFr+9W
         0K+adwKPSKv05cyJuK5hWWY3VQMPaojsKsyuI7+WvLyj6zuMrIIVayReNhjbsVp3q5Ty
         +LQVGenBlX5QxZAQsdiau3fUjvC8CUvZ30FmTNVh+k7d4bVBcG1VLcaHobm8R9BdK2Pq
         1rNg==
X-Forwarded-Encrypted: i=1; AKwUvByPgdrehOjTMD2IjH4L3qEODMh/ZtaEElNjnoCO87I7HV/Wz6RtTGFZ2V7QVwynp14mFsodIw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/Nj1Jcb2/fMqda9ZNrYTbgG9DYV37PaixqoxNCHDguLqa+NKjl
	T87+dvEZCUczakMMbiuP/7oR5bvk2AdfQPGkuejlPz04SlwUOuFdGrD/2Hx8sTwoy/3zHiJQr5R
	y6TRKMkVAxMKCDq/t71dTUvXdCfSCVWR0bV3aFxpkLjw7hB71Z7TmzCGdNFqE8AmkD2vg35tqEo
	XxKtmc9AL3GyACe5lA6e1wOIz0vMoS9kwjOIBmdJH+mLUz56+Dek3tpe9FOdbXPjN0SvWW5SPYS
	E1UIZ4P2F+gTUVs
X-Gm-Gg: AYBFou0CGfZ5LJprG5otU/mcxVXFal/sOx73aQ5mhwWd7bAKIkHXi3acndL3Pr4RrX7
	tQOPdQzYU1u+6EZsdcCqK9arSrF+1KprsaXCtrdiQtozoxLJSYw2fp1COlm+6PNKN/tjgyR9BZy
	SFuR/7NkleuyAKhwTcVBVH3XZQcxMV8LCO3gpj2Knz+Oxdq2MxXSBJ2tL/q1QCh/zanpNu6DvF1
	v+gFU6O0OBMatPVPGQbdNOdmysAh/eZejUGOydEue87apffCcA0mwZ4d487ZiJm/BIiK/+vwM6E
	Ls8izi5UTudT/0hZZgnrTHgRJIiyJgssI/H3/32qsjv3fRGTdEH2BDZcrSV5sVazIiduWNZ/MTg
	VR9b2Nrx/K+KgGf5dvoDzdNM318YK/i9zOzaE4Esa5lbWVI1F+k+11KqHLiZ7+AiC6P8iP54lqL
	bjAouJdYcyShmYPSE5Eh/wVXKTdnTpLJ/SPXC/ipI=
X-Received: by 2002:a17:903:234a:b0:2e9:5178:4e83 with SMTP id d9443c01a7336-2eb36509345mr94354635ad.38.1793714356496;
        Tue, 03 Nov 2026 05:59:16 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2eb3927f384sm2115935ad.44.2026.11.03.05.59.16
        for <asahi@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:16 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1ab289bb41eso474662c88.1
        for <asahi@lists.linux.dev>; Tue, 03 Nov 2026 05:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714355; x=1794319155; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cvUJ5Fu74/yRvPGwst9m0ry7+LODDEe2Sn2iPk6DIvU=;
        b=WaYNYr7z8pJuuSuvyVFkvOpCnD2rvJY5d87fChS2Xxy6RcM8VaV/0YghbibA4kW+cr
         aIwHctwAx1Go3r8jOaKJ0Nie8rJCHFODwtABxzJB9Yele4aI+psSS/jEBw/wuuj4qZQb
         MGzNaGrya/wxqOUBbJ2RSVMbKerxnblmclEpY=
X-Forwarded-Encrypted: i=1; AKwUvBy2BT/wFC6e0u6SKfz8VcZBt2QO1eTczNDpx1IU+s4egfavf3sQmFztNDTeP4nwONzUBzypag==@lists.linux.dev
X-Received: by 2002:a05:7022:7f0b:b0:1ad:1574:aa9d with SMTP id a92af1059eb24-1ad1574aab4mr16954561c88.0.1793714354602;
        Tue, 03 Nov 2026 05:59:14 -0800 (PST)
X-Received: by 2002:a05:7022:7f0b:b0:1ad:1574:aa9d with SMTP id a92af1059eb24-1ad1574aab4mr16954509c88.0.1793714353901;
        Tue, 03 Nov 2026 05:59:13 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:11 -0800 (PST)
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
Subject: Re: [PATCH 02/13] wifi: brcmfmac: Match complete firmware capability names
Date: Tue,  3 Nov 2026 14:58:46 +0100
Message-ID: <20261103135856.3676311-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-2-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-2-b5cbc2cde2fb@gmail.com>
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

On Fri, 25 Sep 2026 23:43:37 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Michael Reeves <michael.reeves077@gmail.com>
>
> BCM4388 firmware advertises "hp2p" without advertising "p2p". Substring
> matching incorrectly treats "hp2p" as P2P support, causing userspace to
> attempt Wi-Fi Direct interface creation that the firmware rejects.
>
> Match complete whitespace-separated capability names instead. Remove the
> trailing-space workarounds for SAE and FBT and reserve a terminating
> byte outside the firmware response buffer.
>
> Fixes: ec64241c9fd2 ("brcmfmac: obtain feature info using 'cap' firmware command")

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/feature.c   | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
