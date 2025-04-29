Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C7E2C1E3B
	for <asahi@lists.linux.dev>; Tue, 29 Apr 2025 11:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745926790; cv=none; b=YpgjCJUi9jS/TebAX1p8/lURPN6KTpdXq9tDifHPUyI+j1bBaD3KpMKwDdHunlXKe66hX0nn4/kQ73BOo0Kmc8EUaSg/LDhL8XobK9UOiK1to9Bcv3PUS4B61BjwbAJI96khCwHmjAoxJNy1lLBMB9PeDywGn7CUDVMnqa7nZiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745926790; c=relaxed/simple;
	bh=BwZDjGnAk1UJgl/brXYK/H4LstIXponojMQGkQ7BN0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtj/827qBolxT2eLYTBi5H7uC8YVj19tO5bQEPebsbebdPQiewr1JMjjMKGFLMwoHfn/UsuANekwoEQNMEo0TxVHDmiCCx7n6CEFaL0nCyFmiQ6Gc/hPoS9B0b9Vbht1OTavrN0eICEJNbvDr3PMb22HgGM+7CRY63V49Xmj9Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bA66Qr+t; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bA66Qr+t"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac289147833so1052088366b.2
        for <asahi@lists.linux.dev>; Tue, 29 Apr 2025 04:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745926786; x=1746531586; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vjNdZRo+0JKNJCIrNVFAoCGrKjiVgsh/8WizVWXn7Jw=;
        b=bA66Qr+tX+yLZB7E+Qrp4kqmeE6Vo60y3sH/jH8KW6S/MMtS+bAT6+hrEpTBvxuV8U
         /en54ObZSTgNszNAUmcFHWBvKuA3edG0rfX6DDnODfmbEIUKHAhZtqgZMmlM0b4Vva31
         u9d337vHbEntwR5I6L6w+KrEBF2PnpGpwl8f1G9lUp6g2FRz+d/+4EA4BrMwwP82/LS2
         ivCj7reMRt+3cjsujl2n5SJIa02Kt5O80uB7r0RTW1qz526Bvgqqpj32xJu8G+jakr8b
         ygIS6cm/VYwp2RPJy1uwgOIfXtqpBKJae3AIGQJjOywGMeAUa9tOpjdHam5N0EEHNMu8
         cBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745926786; x=1746531586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjNdZRo+0JKNJCIrNVFAoCGrKjiVgsh/8WizVWXn7Jw=;
        b=TWTe3efmXwswieWDmrOVVNoZcXTLqXdiNjmb335N3CH7G7JetQOrfyC3AzAsu+Huh9
         44dL6NFLSZ0PBeEzsXYR4ZpyVKbjLusYcZyVCJWZv7ZDs8m5GS+g3EBGU52D3EvTkjyP
         l9yCRnMy2aLqkMrxoy2apOtNMbvfQNXV4HmT1Cvlb86W3WletATUId5LiB8cKyDl/aUd
         ooW0OcuUXl8VOrcbRq4aO9p7nog1uLMJWeMGO45tdQ/mYPfddPOIES3yDNDVj2zOekO3
         VEngovKbQ1rkxVwcl7Y8QzbznP0uj+CIY6X8j9ftNGgP+5ezrpyHh92ibpkVIXwhMEZO
         vTcw==
X-Forwarded-Encrypted: i=1; AJvYcCVVk4TPDZhc9/+M1voIaSHNACtQR1j2BoQokTqmRH4NUfc2bqaHghYMDEWxbfamzX9nIs3PEg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7lTKHYjlro7eKn7Tq7y0jHMlICvSkv4AA6a8DD2r+X0AXYiim
	0NMjHeCuPF2oCMYJBYsB4/v2rQWYMohofZH6bqcxz379RrL5Dnq/D9tXRdjHdIQ=
X-Gm-Gg: ASbGncs6s+kWby6ItSNXNMgbQnQKzPuxgyZb1M4OsoSiRHc8bSCDpYl2O182xcsXARb
	Hip1KywqiOHW8vZnEIycFQIBmHJbaqpk40A2OCN+7f2MLurGEbg7obEMFv2Td/jh7vlCYW2pk1t
	YN5NVZ2TaEmASt5gxojLNUxADoqAb5Jtn+JmOgL+9uiDoiV5Iifak/AhuHEmKpd9Rvmh2TkdJbs
	Rza5YcVdRw7sQtGmva4LTGMNPdyMQcw4Gw16oydeQRIncN6n2oRcxEdtdQnfg0yGEOWG7wigxZ5
	2AJJPEBH0Ox4UG+5vCbLTK5k3txFaVeXFZJ7fl8J
X-Google-Smtp-Source: AGHT+IEvfTQCJKCNh3qhke/KxsW/y1p2uYXP6K9g5VKxCSG1GBRIRQqV1uYXaafKpVqcupU8bMrCXw==
X-Received: by 2002:a17:907:86ac:b0:ac2:7f28:684e with SMTP id a640c23a62f3a-ace848c2393mr1062210766b.6.1745926786169;
        Tue, 29 Apr 2025 04:39:46 -0700 (PDT)
Received: from pathway.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acec0530c37sm169875066b.136.2025.04.29.04.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 04:39:45 -0700 (PDT)
Date: Tue, 29 Apr 2025 13:39:43 +0200
From: Petr Mladek <pmladek@suse.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Aun-Ali Zaidi <admin@kodeit.net>,
	Maxime Ripard <mripard@kernel.org>, airlied@redhat.com,
	Simona Vetter <simona@ffwll.ch>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>, apw@canonical.com,
	joe@perches.com, dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
	Kees Cook <kees@kernel.org>, tamird@gmail.com,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	Hector Martin <marcan@marcan.st>,
	Asahi Linux Mailing List <asahi@lists.linux.dev>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] vsprintf: Use %p4chR instead of %p4cn for reading data
 in reversed host ordering
Message-ID: <aBC6f8Vmlik9ua0K@pathway.suse.cz>
References: <20250428123132.578771-1-pmladek@suse.com>
 <aA-0MuLxVTueDAhm@blossom>
 <PN3PR01MB959715E4B4C95911A60ED075B8812@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3PR01MB959715E4B4C95911A60ED075B8812@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>

On Mon 2025-04-28 22:38:13, Aditya Garg wrote:
> 
> 
> On 28-04-2025 10:30 pm, Alyssa Rosenzweig wrote:
> > Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> > 
> > Since the other patches went thru drm-misc-next, I guess this should
> > too?
> 
> I think yes.

Yes, it would be ideal to add this to drm-misc-next as well.

Best Regards,
Petr
