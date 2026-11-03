Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714362;
	b=F6ZvZsj4aj6DDbiBa7lBsagCrGmAwmvO14aPt+xdctPk7fgvL3avkyGHMw74zb4RVC5l
	 mxxrF+u1sasbeA0h9nMnvwir/PpfPcwmS5ZIsgeRR64paj+MlYmtqpE/8W1A7k69Qghld
	 Hm21WMpU4xybu+MhbMe3WiXwjwGcl1xqSRaRgJQrmz0SHcXzDkoSwr9bWQ2D10mBJGbQl
	 P0+KtaoT4N/jSPMgfsqxA1bU9FL162DbPxArYrrzGcUYTJOTKK2943PqRAv26pFA4rpwe
	 NDO2f2jPyzxz9HTTQ2BnVr3szFUr2RYKWLW85L6KIp4CPYqVR4H1ZjLWy5VhXTph8WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714362;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=ApeHudjpRw1j4fPKuyoZlTN6SSSk0BmJ7DVYBxcf3Y4=;
	b=fZV+RihrKOTl6kSq1VoYSXFPwGht4F+x3cQTsYa3gjhiNzQ4l4fowFRANgs2OKe3DzsX
	 pFQTz1wkKM20BsOhGGt4wXN3GLgcCPfMj6rxLBOG3opQ0bLsU943Ei/Mih6qEm+HojX+u
	 I/ZyCvABvsJlBtEKHBkozJYPN1VdPTDwubOIRzKKCOp4jGe6V6ekN72SkyvERjlJ9Mair
	 HZ0ygzOycUsnZoPD0ruedBFS3jZuuvlY8Sri+vbLd/4vdpTpYRNYO2DIiJilAtQ4vwFpF
	 eMN1toNEYfojiaUWFnhyTMNiBkaNKnLlNiX6FufipPrTnJerm+khDu9WtfQDNHeI5OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=H9NSzMlW;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B7E606D816
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 13:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58B7E606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=H9NSzMlW
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso1818767a12.3
        for <asahi@lists.linux.dev>; Tue, 03 Nov 2026 05:59:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714362; x=1794319162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ApeHudjpRw1j4fPKuyoZlTN6SSSk0BmJ7DVYBxcf3Y4=;
        b=w54bCjp17OKLgZfKXHxXWtKP9IH9a2p3mktJTGWtTjYfpXHtZ7KmK4yMoAlTU4dCB5
         48cVndAAE5xWILifj4HXqdTVO9+ozaN2/HRQkwZEJ70YouZ2zbjNl7rt/xn/eypKVyjS
         AwQZ7hG8RUg759wattzyhOOz7QNx4sZXYIv1tm7kPNGVZC0Cbr9yEDxpFscRCN4iEmLL
         kzsZ6EMZTdw+tGkAO/f5fJnSCmWXvGaitPpiDPbIdIpFq9OGHP3XGID8WDDvn2VggNZ4
         ut6HLdGXrxhrQ6kaojvOoH20l23bp264vVS07YzSz0G4hqoapAa9NyDqOurCqIs1RD/6
         c0xQ==
X-Forwarded-Encrypted: i=1; AKwUvByxvh5MZ1nfo4oUC5xX9H3y+Ah47q2PFfHnN08YwTCHsCTuVe0/ILXoWAGKIh4KfizDtUFYpQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8EEsS6gMQOSBve1p7mrQokZrrl2EWzge5TXw5GEP7+1JBvNuxU
	gc9T0p2HElufocmiIZ0372XdHwp5s3X8Dcl6n8Tw2cTKog5iKZgu1mNeb7V6haoJIJ+ERz0p5zq
	EZR1XEeKK/vHqg8YeHb6xNmUZC9orzPM/xwsYL/MTLGq3BGlOyQ7uX5pA5Uk+upFjI4AkwBHRCM
	PoBzt7nPqJosJ0NplKDACtbPwL17SA7aKiH0p6osKkCYdDLYITe6zZgsWnh0q+vSnZKUv4NbsWj
	iqrWbstDI67gaKC
X-Gm-Gg: AYBFou2zkt88ySLDhvh4Rqh14rOLmGbeknfEzOPHPqqn/pUS4FoqGY+tDDpwjavQn9C
	4XBEZGRFCki0eC4/uC2mrIcMdUwYl5JpDc9ZKIylkJyCYIsG8UdLb3ukcY9eP0zs2Z4uN6BjBWl
	tJO9b5qoHKCEXYkZpoH5x+Ane5AlPAJxy6BBOfJ/eaY3/L6g25CFtpk1RpNfljGbP4jDEQ/TBgb
	XG2L6g46V9ISg3kmYZzH64SdGES0igjCZjyoUVATiyPhWJ243JH7qMCbQQmcb7kpaPQxQWXpGcO
	6FgHf3PVoeM+rkAZVqy3VaWcuoYhTpVQ1jcht9Q8NuBB2fBZO32ApmsQsItHVtAk3vDzlBpg0B4
	t2z9VL45OxS50LgQRFb4qD67Rs4XyemUPFFyJ2M38GetlcjG9MY18LkSVQB7XcwCNBRl/7E6MOL
	mZy3KD3QhPh9bqDoMf9MQ4m2mjJjgXzIZ4NTxUi1M=
X-Received: by 2002:a17:90b:570c:b0:3ab:e588:c288 with SMTP id 98e67ed59e1d1-3ae897ccb52mr11602012a91.11.1793714361420;
        Tue, 03 Nov 2026 05:59:21 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2eb39297d57sm2102045ad.52.2026.11.03.05.59.20
        for <asahi@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:21 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso1110027c88.0
        for <asahi@lists.linux.dev>; Tue, 03 Nov 2026 05:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714359; x=1794319159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ApeHudjpRw1j4fPKuyoZlTN6SSSk0BmJ7DVYBxcf3Y4=;
        b=H9NSzMlWRPOk0WSXa/Q623hQXA9mQmGf3XHdnDR8tM2JEw+ReRQ60zFKWpyrm4+0Ld
         pMdRHhpQpEBPE7zaH1qTF1F1kw0p6yd7F7QpIZDFdeTRpCuebk/MP1hBc67ir74jMmp4
         IpZeGtAHBjA/6AtutnOcqA96rZth78q2DM+CU=
X-Forwarded-Encrypted: i=1; AKwUvBxEwXS4utQ3xnUk3rCFpeFa2L3NFrZqCtd168PnlJ5d8rJ8BoP7Fn5ibAvcGlnXfztxm397ow==@lists.linux.dev
X-Received: by 2002:a05:701b:4211:10b0:1a7:99b9:2eb9 with SMTP id a92af1059eb24-1ac5de4e8a1mr19735559c88.27.1793714359419;
        Tue, 03 Nov 2026 05:59:19 -0800 (PST)
X-Received: by 2002:a05:701b:4211:10b0:1a7:99b9:2eb9 with SMTP id a92af1059eb24-1ac5de4e8a1mr19735501c88.27.1793714358682;
        Tue, 03 Nov 2026 05:59:18 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:17 -0800 (PST)
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
Subject: Re: [PATCH 03/13] wifi: brcmfmac: Fall back to RSSI-only default join preferences
Date: Tue,  3 Nov 2026 14:58:47 +0100
Message-ID: <20261103135856.3676311-4-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-3-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-3-b5cbc2cde2fb@gmail.com>
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

On Fri, 25 Sep 2026 23:43:38 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Michael Reeves <michael.reeves077@gmail.com>
>
> BCM4388 firmware rejects the default join preference containing a 5 GHz
> RSSI boost with -EBADE, but accepts an RSSI-only preference.
>
> Retry with RSSI-only selection only after -EBADE. Log other errors
> without retrying.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c | 4 ++++
>  1 file changed, 4 insertions(+)
