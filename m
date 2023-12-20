Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6658F200CB
	for <asahi@lists.linux.dev>; Wed, 20 Dec 2023 10:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CnKGBpk+"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2cc5a0130faso55394381fa.1
        for <asahi@lists.linux.dev>; Wed, 20 Dec 2023 02:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703067409; x=1703672209; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bLKRTJeioS1VJHFUkfG9Q5dLKyrk/O35ucZ3AmopT1Q=;
        b=CnKGBpk+YWv4uTSoZPcWPEOlfaNjDozNh8joK9wFuIg2n8/pYx6Jz+KhsADXZ78WSQ
         +xvsZeJ6rdNJa9b088o7W4Rltc4auurp0VQ/JAyyZ0vdEAYr/1dcB6CzgNWqtXfZgiMW
         nObFawAr4GfjlaK/rW3kMbUAoYEnBBNEck/7ktPxt4nl00pvSH31Bn2aH2tQHxUxBNy2
         VutC8p8inMhI9KGGbXexeBEv8zDFD5lL3Sr/832u7IhYjmVQdUZbKgB5zaB3EosuPR/6
         uxUu370uDzcqBh9l2WD5rh8CawfC0h0Nti/hWCri6ZhOuNpHO2lC/KvLI5tdnivw+FvL
         yN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703067409; x=1703672209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLKRTJeioS1VJHFUkfG9Q5dLKyrk/O35ucZ3AmopT1Q=;
        b=Z8w1fTUHJT9LVBrxSU1IFB/oJl5LoNOPqpdxqjUvHYzvnSxV3uHGHr/3vDjLQsmur/
         3itihShUtWZYFKuxLGp/Mq7SD48qpCzPF3IG2NrPp/Cd/ywVVBKvS7rBh3wkmCb12dVk
         QfyF86e4TF52SJ5g6WRYaemmhTbg/z6eLzR49+blhfCyW0f7TYyeXSbykdaWFz9xJ/od
         9itcAX8wTpE0mOQCNsFBbwvjJ4k525kaQYwH2lKZgPIOb2xLDj51d0DFAKzCZGXaRXeZ
         h/lQkJTpHX90MBFqHXHMq73gmMLYLW5uROysNW1kmThS69MTSAPZIjArgmEV8tasszV9
         Y5iA==
X-Gm-Message-State: AOJu0YyyKCUsLoFqMJuyslGSvyvdxAtqa/Us6bUrH1KjhzK5ePEzg+7h
	oMz6CyItej0DN4aj7y6i09w=
X-Google-Smtp-Source: AGHT+IHCZlNDtZtitEkz2UcUatuFck1SyzrZg9lQ8IXaxY+RgMr2UPGpuNdSzAnA/KqTHyQWaAE7jg==
X-Received: by 2002:a05:651c:1a09:b0:2cc:6cde:ba5 with SMTP id by9-20020a05651c1a0900b002cc6cde0ba5mr2796613ljb.19.1703067409131;
        Wed, 20 Dec 2023 02:16:49 -0800 (PST)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id bz24-20020a05651c0c9800b002cc75dcde4bsm988474ljb.23.2023.12.20.02.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 02:16:48 -0800 (PST)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 3BKAGj7A016312;
	Wed, 20 Dec 2023 13:16:46 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 3BKAGhdk016311;
	Wed, 20 Dec 2023 13:16:43 +0300
Date: Wed, 20 Dec 2023 13:16:43 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Hector Martin <marcan@marcan.st>
Cc: Arend van Spriel <aspriel@gmail.com>, Franky Lin <franky.lin@broadcom.com>,
        Hante Meuleman <hante.meuleman@broadcom.com>,
        Kalle Valo <kvalo@kernel.org>, Daniel Berlin <dberlin@dberlin.org>,
        linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
        SHA-cyfmac-dev-list@infineon.com, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev
Subject: Re: [PATCH] wifi: brcmfmac: cfg80211: Use WSEC to set SAE password
Message-ID: <ZYK/C3LzK8LMOjER@home.paul.comp>
References: <20231107-brcmfmac-wpa3-v1-1-4c7db8636680@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231107-brcmfmac-wpa3-v1-1-4c7db8636680@marcan.st>

Hey Hector,

On Tue, Nov 07, 2023 at 03:05:31PM +0900, Hector Martin wrote:
> Using the WSEC command instead of sae_password seems to be the supported
> mechanism on newer firmware, and also how the brcmdhd driver does it.
> 
> According to user reports [1], the sae_password codepath doesn't actually
> work on machines with Cypress chips anyway, so no harm in removing it.

I'm sorry to disappoint you but I've just tested this patch on a
"Pinebook Pro" which has AP6255 module and it broke WPA3 Personal.

No error messages are emitted to the kernel log, just iwctl saying it
can't establish connection.

This is using "Cypress" firmware from the Linux firmware tree [0]
renamed to "brcmfmac43455-sdio.bin" which has the following features
(extracted from last two lines):

43455c0-roml/43455_sdio-pno-aoe-pktfilter-pktctx-wfds-mfp-dfsradar-wowlpf-idsup-idauth-noclminc-clm_min-obss-obssdump-swdiv-gtkoe-roamprof-txbf-ve-sae-dpp-sr-okc-bpd Version: 7.45.234 (4ca95bb CY) CRC: 212e223d Date: Thu 2021-04-15 03:06:00 PDT Ucode Ver: 1043.2161 FWID 01-996384e2
DVID 01-1fda2915


This module is used on many SBCs, including some RaspberryPi
boards. The reason RaspberryPi owners complain about lack of WPA3
Personal support is that most of them are using obscure downstream
distros which ship brcmfmac firmware from somewhere else rather than
the Linux firmware tree, so they lack the "sae" feature. Another is
that it only works with iwd while default is wpa_supplicant.

So far all known reports of those who tried the right firmware on
RaspberryPi boards confirm WPA3 Personal was working with iwd [1].


I'll be happy to do more testing if needed. Thank you very much for
your hard and insightful work!


[0] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/cypress/cyfmac43455-sdio.bin
[1] https://github.com/raspberrypi/linux/issues/4718#issuecomment-1279951709

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
