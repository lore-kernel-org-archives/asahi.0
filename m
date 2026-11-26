Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703395;
	b=m1v/5Rd3fDsiIhWWM/utLm7Asy/zVowySF1WRtOhia3WjNxfzkrFVhXhMqM+lz6UmiPn
	 9Veyp+8X9FTcXAfbJIRsegzVDO1O7uTivdncx9u+llYKTFtINVccmDeNn0YOlqh5ss27i
	 SzW//CzBguwZfS5W8QIuZ8wgkPdCta4UX2NSt8x/4heGuOt5conVyUL3LvXns+dCSiSs2
	 Hdpv7KJUnz8Vb+PmLBMEfklALGaFMG6vn1w9W4Yp7F5iKWW57GhYQKeD9KLp0EyaBDIQY
	 xA4QHTSMz4QbW9VIdD0ezuL2d2upeSTz62Ckux3RH9GGUsjSbYDe1Fk15JuiVMPhD6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703395;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=ni0P+OonBPhIdFE9YXhQeXLtmxxlE4xbNiyVqsQWDK8=;
	b=Ym9Lw5lav+dmJxdVR6X9WPPjLYw8iMaBmAEspJaYQ4zPxaq+d5wdb6fAOcukcnUNI0BG
	 cni4T+c09hHLh5q3kwdUVN9FbpOTfN5XmfbG8PRHPMp+ioKZQA2VZHrh/tVsIkozN7e0g
	 ZsZ/ikeaKU4SVv1VJRvHDqCOytc3tvjOWaLvwfdsqBkn9n/x6dMjgxCeP1XcEOP8k5akg
	 5DzLMsyiP0E2iocIIX9LXa9lBrw+Lvv4AsVsKEXTiZrMGXR7UcuTXE4SzFsGAodtpyyrL
	 NedqXeS0ybuMjRZrwswnY1PKwHK4ea/rgbCwGnCQ/uXQYYcKoAjwl4pt++P0/hclJjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gQSc2MPn;
	arc=none smtp.remote-ip=74.125.82.228
Received: from mail-dy1-f228.google.com (mail-dy1-f228.google.com [74.125.82.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232D1606A69D
	for <asahi@lists.linux.dev>; Thu, 26 Nov 2026 14:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 232D1606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gQSc2MPn
Received: by mail-dy1-f228.google.com with SMTP id 5a478bee46e88-3863db981d4so9967460eec.0
        for <asahi@lists.linux.dev>; Thu, 26 Nov 2026 06:29:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703394; x=1796308194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ni0P+OonBPhIdFE9YXhQeXLtmxxlE4xbNiyVqsQWDK8=;
        b=QbKJdEQ9MvYHbvMFZjm2SHggH9EkuL+UdLATTIULdfNfrNUd67l9SSnBQLiJuFN7RR
         l+fKqjeAjG3orVNOxmXZrZrPl4vkERXBhnT3fC32CBEaeVjPHs/48G5tX5I2CaiDqIjb
         axq6RcIFYzYsDCPAHP+piVnyYDRhwHc3FYk/i3uSpyNn4V65Jz4LRIyLIzwuoapzkKBl
         vU27h85GsKXuGn1cA+ypVJq4aZZFgJzoRIHKPH0AHRhma3rJ0qPS6L+Ooz9EXmzUlJYl
         CCqY4YAIAr98OCJcRtdSW+NrkrN0kGqz3buucGgNvCrgN4HLy1AK6K7VVxpTgtQTNYMf
         F5tw==
X-Forwarded-Encrypted: i=1; AL+hErG04u0/inyAbiY+Ab8TxN+BjfvgIE7HgU0i+zK4IUrUJfcXgwj+heNLRgbi/z8F10KbNYzdng==@lists.linux.dev
X-Gm-Message-State: APuU4Z82CpEYjVi+yPNm2wHkc3MwrGu8zN+HBWIUk4r593Lsc4v6O7io
	jEw0+sv2hcez/UPkdXKi/c4EG6hUfBACSbGsviF5M32L6TUwPGa1myTmOhlhYoJXBwcHcWwi/K/
	lwwH+NpXZbwYp/8Fc7Df30z97nTXPy0ApZG4nz7mo8Pr0rpmsWuzE44X/84haSlg/f6R2SEjsqk
	Qf5R13VPB0/1hOeOqQdmEk/QiUan4zrGfpuchfP6TkFyevZtLlJx1CoPkA+Hcd9skpoc7844KBx
	yxn6OBU6QccxFTU
X-Gm-Gg: AZFdTZccr8GfCOLUdi0/eNsDfw2tCRQLZVr/KPvLnJXtznTWae3QuNcrI2HlVRHpiFe
	ZASuhe4bGIg6O1xlXJrPZ+dsC/BAaHCx8+0kz9y8Ypg+0DYH3/LooXRTzS90/XA0XqE6YnLC8Os
	+PaPphZ85Owkg4v5fDp+Djf1EJMgpZtYPKwwyoWw632LuQLyMLVwdv26qeOdr+FyEQK5SbhhOt8
	LUOr3JCVllOPz32QqY+R5tmh30thB1vB4R/PtcVllZacnl5RV6N4zAQKc1ZBcOxlxKwol2NG3z/
	aBRugQyBxZdJo43Akq42YVlGDCXMEBZZvJT6ZMlSN4TgnuZMCkLvqQGd/dDSmiwfLTCblWDwU9s
	R91xqZhq+QEEIGCBlcvFa+GW9LpelzuPHgJ0jVMgKt+HksOfUtmgI/CWNIQoqltG8KJM7s/oUCO
	PE+mNzuQJr3P9jdFZOg+J75/0nXfipffSqj1VOXSc=
X-Received: by 2002:a05:7300:f14e:b0:386:d917:8d8a with SMTP id 5a478bee46e88-386d91794ecmr3427846eec.27.1795703394021;
        Thu, 26 Nov 2026 06:29:54 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-385af7bda10sm3185397eec.8.2026.11.26.06.29.53
        for <asahi@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:29:54 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5363fa3d3e4so119022841cf.0
        for <asahi@lists.linux.dev>; Thu, 26 Nov 2026 06:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795703392; x=1796308192; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ni0P+OonBPhIdFE9YXhQeXLtmxxlE4xbNiyVqsQWDK8=;
        b=gQSc2MPnWm29VtF4uufOC2SiYK3IM0i1gV1kue/M84UQpnHTIkadvKbE/9/I5h+1jd
         XIZneP6cPG5bd4M75Ci40YvpGZIG/d9e5hQeOIBtKRuvpgh1EM0QMsMi3j7GIhA3I0oe
         tw3OqmpzdAS3ri7TN75tyrSjBfAH7z92D8I2M=
X-Forwarded-Encrypted: i=1; AL+hErG7pRFNalnuGvkx3egZd3IqVCAY15pliaL2UdLQFPoFw6ZLNsnAg+6btbwi6Ba0QlozKlEZ2A==@lists.linux.dev
X-Received: by 2002:a05:622a:2586:b0:55c:6d3d:b688 with SMTP id d75a77b69052e-55d767ae63dmr394072281cf.0.1795703392443;
        Thu, 26 Nov 2026 06:29:52 -0800 (PST)
X-Received: by 2002:a05:622a:2586:b0:55c:6d3d:b688 with SMTP id d75a77b69052e-55d767ae63dmr394071861cf.0.1795703392021;
        Thu, 26 Nov 2026 06:29:52 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm181098511cf.17.2026.11.26.06.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:29:51 -0800 (PST)
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
Subject: Re: [PATCH v2 2/5] wifi: brcmfmac: pcie: skip the host ready doorbell at init once it is a capability
Date: Thu, 26 Nov 2026 15:29:40 +0100
Message-ID: <20261126142942.881504-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111120748.23795-3-dev@deq.rocks>
References: <20261111120748.23795-3-dev@deq.rocks>
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

On Wed, 11 Nov 2026 13:07:45 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> With host ready in the host capabilities, the BCM4364 firmware halts on
> the doorbell that brcmf_pcie_preinit() rings, before it answers the
> first ioctl. The B3 of the MacBookPro16,1 does so on every load, the B2
> of the MacBookPro15,1 on some:
>
>   brcmf_pcie_handle_mb_data D2H_MB_DATA: FW HALT
>   brcmf_attach: dongle is not responding: err=-5
>
> The BCM4377 stays silent without the capability, so it stays. Once host
> ready is a capability the firmware takes the doorbell as the exit from
> D3, where Broadcom's DHD driver rings it, after D0_INFORM. Ring it at
> init only when host ready is not a capability.
>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>

The sentence "The BCM4377 stays silent without the capability, so it stays." is
unclear. What stays, the capability or the doorbell? Also please add a Fixes: tag
for a83a99d063a0 ("wifi: brcmfmac: Negotiate PCIe mailbox transport with
firmware"), which introduced the host ready capability.

[...]

> ---
>  .../net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> @@ -1599,7 +1600,13 @@ static int brcmf_pcie_preinit(struct device *dev)
>  	brcmf_dbg(PCIE, "Enter\n");
>
>  	brcmf_pcie_intr_enable(buspub->devinfo);
> -	brcmf_pcie_hostready(buspub->devinfo);
> +	/*
> +	 * Once the host capabilities enable host ready, the firmware takes the
> +	 * doorbell as the exit from D3 only. The BCM4364 firmware halts on it
> +	 * here.
> +	 */
> +	if (!buspub->devinfo->shared.hostrdy)
> +		brcmf_pcie_hostready(buspub->devinfo);
>
>  	return 0;
>  }

This skips the doorbell at init for every firmware with shared version >= 6 and
HOSTRDY_DB1, not only the BCM4364. That includes the newer chips the BCM4388 series
was written for, which as far as I know ran with the doorbell at init. Doorbell 1 was
introduced to tell the firmware that the common rings are initialized, so I would not
drop it for chips we have no data on. The B2 only halting on some loads also suggests
the doorbell is rung too early rather than that it must not be rung. Please either
limit this to the chips that need it, or ring it at a later point if that avoids the
halt. Otherwise I would like Michael and Hector to confirm that the other chips do
not need it at init.

Regards,
Arend
