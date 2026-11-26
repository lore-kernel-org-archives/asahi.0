Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703390;
	b=Xe6fdeXFKIj/cv1Bn7SLH/ZC7F8kvVw6VA8WXE07PRAfp8H7ACKAjS1Oc4wqjjumUZjx
	 Lbndf/eOPNYedj1reRBgnLvs2HSfeW4saogTZFDwgUCst412Mj1mHml5VSdmVpnGuf8Pf
	 rV6uc2rgZtsyNdOvSCOkYAKAZ8sy355aUksOm3DFK3xTE0Kf434xykcj2B8XRBQfcp8D7
	 6tJ/GDPnaaKGXcLrIGjlM3dBowq6+nQqz+apBpmr1X6Xn9edQLY2XT7MhAWnK/nhAH5HS
	 v1ujVo2ES2Y/Y0yDhW3dFovuiie1xGDdiDHrDdTu7wKy++NvseOIHLdqjYeem5WaMOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703390;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=R9AqjUS/CAqhaZ7UAgXTn4tXqW1wVTJDC+c9fuKtePc=;
	b=z0RNyYrCtfQL/fxyql/6OFXa3y4yyoWgE3nuSvxESDqJvv6Ib2W0wADK0W1mu6Olvv23
	 wZfU1CmqyUpE/GIS10WKXIV4SpgKEvw/UPBWH5I++qG0v9OsjuaQJK9ilnihuG/1mQAxc
	 HcVFlglL1JKe6HFYBiLIiSE7ZozdGPOfCNrfkb3wbtl0zXy5fivEqb4e5Jk8rB2GqbP/h
	 FMEGRTSFuQXAMqYgiIIm8xxfY41CCEb3oHKt0nhFnRLpCD1aEA/WQF9tCT4NQjXg+OkG0
	 jzD629ci/3inJz+H2IlDgmCwHe0z1ozuwq781PpijwPGrhKoApoYStaFLj8bxxT/M7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=K8gaxPOS;
	arc=none smtp.remote-ip=209.85.214.228
Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC9B606A326
	for <asahi@lists.linux.dev>; Thu, 26 Nov 2026 14:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CC9B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=K8gaxPOS
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2f04244c3d0so56687095ad.3
        for <asahi@lists.linux.dev>; Thu, 26 Nov 2026 06:29:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703389; x=1796308189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R9AqjUS/CAqhaZ7UAgXTn4tXqW1wVTJDC+c9fuKtePc=;
        b=betZ+uA1S4ijSPGiN/p3V3Wit7NKx5ojW9zOeSseD/KeOWA4P3Ov3sdLH1S55mx0Tp
         U9w6IlYx2ujyskolVjSqAWwI5Ur6nWnCdkJSl5/jaTxRY2oCMeiO8VXXU7WvfbJezDLt
         27RZlFigOkKBgOl0+WmnRwt0qUC7fxZi9PFftjZehihhbKFSbhvRY7LEvTp06CxN2JBq
         /PuI6sdDVocuSkfwlpAEMj2aNL9erSSAZCjrFMVyNEH4ZU0wloVgZdiJEe8r/wfTEP0t
         CuxrVUJUv229BhXVwQTKRtYw/mNKyAm+SSRGZjT/NnZBNzM4x5mz3+c38tHsxY6d2EES
         +GOw==
X-Forwarded-Encrypted: i=1; AL+hErF6BuUNTV/Qxae9bIfnK3DB39Sj4z5b5j5p602zmNQ8p0XN3B/J+BBzC2W9xpcOMh8opCAEVg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9sFybP3HXNVHGmqSJl86mLDTfVLMW5IcOx6a2sQHXYQKgfFY65
	S0kTju9XcRwYU8iYn4dQ5D27pe8FO2UJLl9+DFcRJ57HmBFpjeR+6B4U2TXrIneUIVUoe04S49B
	39LK2EJCMkjw6mo2PMn/199cBldxx3ZWXatqdkvoo4QsGJFjqHsfKxrZgPd+hmWQhtYx3L40rF1
	UM3ncGZnBDClm5et0oWettdWl6iWcfn1YGmVM0UxNbTxr9Ts6dQUl7X5LC/oNvfjgFQZjMMsiE+
	30VZQvucy8kyWJ2
X-Gm-Gg: AZFdTZcc3fUxt39MFq+6v8ZffmtiRAph+u6DrUrtoSMa2i/5uYB0fF1OBlklqQwZ2xY
	U2WsyTH5T0KBKXdWERrQEsG0iV0zD+3hyhKnjQK7glxun/QWweM+vhzEjQ/ZB9BD6WfXl51aYF+
	rpoWaGF/firT3f4wkfjlZ6P/Z27kOWOHGginmPEtieMxAuEZCL8b9rsdqGFsqByP5dyGJ/UvOqD
	Csi13WtRdiJwgp1oBI3rFoL4szW3srujENss9p1T8dzEo/9p2W9CPAM5kJPOSjSVPJGw18THlFV
	jSgDAN45ih5kiBZwfFvTBRW2SKJHyuGwecKGOi3H4jak+Og9WQnOek/PkG/LTmrN8wr0qz7eiRI
	NfOrwKBkXiVqxnl4SoqBQDGZvPs/q1YWaIDZlyVH4b0QpjMK9FtWy3gPcVVZI6ATKaCYM81136u
	dU3r2hAwv/7ojiKEe3vFVlkcf05GPFX28xdwDECaeOHw==
X-Received: by 2002:a17:90b:17cb:b0:3b1:3598:f881 with SMTP id 98e67ed59e1d1-3b41cb20b9amr21287334a91.53.1795703388804;
        Thu, 26 Nov 2026 06:29:48 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b4062eb7cdsm15263449a91.8.2026.11.26.06.29.48
        for <asahi@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:29:48 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-537548d4bc0so160796281cf.2
        for <asahi@lists.linux.dev>; Thu, 26 Nov 2026 06:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795703387; x=1796308187; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R9AqjUS/CAqhaZ7UAgXTn4tXqW1wVTJDC+c9fuKtePc=;
        b=K8gaxPOS9aACIhjvthXecsCQtylaGAFuTlXvrj5w/chjk1a6SjWfIA8VczkSSuwnWp
         TmbYjLU30+KRPGN74aOI6GV9DKc9wu7ZLn8ifeV0D3zJrSalDlYmUejZS2lYinnEiVp3
         xPK6/kQRj+wpgWpNXeSlnXeJH5z2wow7/mN+Q=
X-Forwarded-Encrypted: i=1; AL+hErHt8BVhWoxts2nHVJ+SI5AXsf65h6SrvvDyLEGk99agAqievIh1iXmXHBG9pieJHM2lB9u4gA==@lists.linux.dev
X-Received: by 2002:a05:622a:228d:b0:55b:afbf:aebb with SMTP id d75a77b69052e-55d76a1f00fmr401901951cf.24.1795703387402;
        Thu, 26 Nov 2026 06:29:47 -0800 (PST)
X-Received: by 2002:a05:622a:228d:b0:55b:afbf:aebb with SMTP id d75a77b69052e-55d76a1f00fmr401901581cf.24.1795703386998;
        Thu, 26 Nov 2026 06:29:46 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm181098511cf.17.2026.11.26.06.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:29:45 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	michael.reeves077@gmail.com,
	marcan@marcan.st,
	j@jannau.net,
	asahi@lists.linux.dev,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH v2 1/5] wifi: brcmfmac: pcie: set the state before D0_INFORM on resume
Date: Thu, 26 Nov 2026 15:29:38 +0100
Message-ID: <20261126142942.881504-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111120748.23795-2-dev@deq.rocks>
References: <20261111120748.23795-2-dev@deq.rocks>
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

On Wed, 11 Nov 2026 13:07:44 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> With the mailbox on the control ring, D0_INFORM goes through the ring
> write path, which refuses to write while devinfo->state is DOWN.
> brcmf_pcie_pm_leave_D3() sets the state only after D0_INFORM, so every
> hot resume fails and falls back to remove and re-probe:
>
>   brcmf_pcie_send_mb_data: Failed to send H2D mailbox data (-5)
>
> Set the state before D0_INFORM and back to DOWN when the hot resume
> fails.
>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>

Please add a Fixes: tag for the commit that moved the mailbox to the control ring:

Fixes: a83a99d063a0 ("wifi: brcmfmac: Negotiate PCIe mailbox transport with firmware")

> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

You may add my acknowledgement in v3.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
