Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC162638A9
	for <asahi@lists.linux.dev>; Wed,  9 Apr 2025 15:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744212620; cv=none; b=gvmTw+dDwXFMCUKrXEfGwDnMOLer9HC5az4bekYZPruMzwCgwp0yGDcck10GsNubRCcJ5fJS2NO8bYs04eS6ubivw1WD2T0UVrFM+kzxTS7EQmzMgJWQnsQtLQQlowGLkJTPFySy/7FOd2FDgGiTM6sQzQWqdTDrCXWEyiqwNr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744212620; c=relaxed/simple;
	bh=cSb7Z4Wciv1Wkwau8LKbnH/lEO+Br0IiyaGQ53DULh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F9eflO5vcKGHq0lzNv0bvTLnpyzBbz+OWZytt4CVz+bXb3pvI7/znn2rXhKz9c/6XqhIEGf4+ZFIwhzLaTMm4l2fZYp1V/anbIq5NzlYr08r5PYxUzzBz96l1ZtsHXRlzbJj0mX8M11X7jY3Sc9ZrkgUCqx+dNKVweSzXDz5p1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AdFQa1uX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AdFQa1uX"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso6511895e9.0
        for <asahi@lists.linux.dev>; Wed, 09 Apr 2025 08:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744212616; x=1744817416; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NYoWpZxajoIHIaYiHf4bHzvKRXNdl/YUkiNhw0QxN6A=;
        b=AdFQa1uX3IQQfNR95yvuO9V/wD87wstvGvGAVTJfOa3LIBPDFQrcecnEgj7Yfpf68i
         7/XKpBiFNo9R75Tyh2qUflJBotA7Oy2XeDQjHWGwbtDkLW2iaCEKGQZQNlU9ZVt8lzCX
         5AderiCYfcnVsVwavQ4vUM2CQebUxxTORHkt755nmTz1TY+zMvvrku+ULM8K8Y/738ck
         PNpdkr6lTcILTZEqomR4M1k8nmoiXTLEQXFI3PV8bQgiuQIwXnVISdiEDMJ9TjNbo1YV
         f/rLrp1vo4KNBGe/vjgdSbSdH3mjdTifOdtUhG47u7sDs/4+stmScJOrnEbohRvceyao
         N2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744212616; x=1744817416;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NYoWpZxajoIHIaYiHf4bHzvKRXNdl/YUkiNhw0QxN6A=;
        b=AUhH4s9FGBkqXcvsokqWQF6Ig2bYlumemra77Tg2S5H8kwGzkKFviurN94HgGqqlnv
         bUi/fNrf0MeXIIW9StKR4kpWwbuJecl1rwiPUqr5jPjIMF65ISPHh1q0rpFXKPpZfHu/
         NfqkVJhc2Q6j3VmgjzPjSdaU8qRgAenN8w9svTfhbk9s3NgX+lIywENre5OBoUNf3gKU
         3oSP480W29B6z4BuuNxCxmGcuSt66bIkeKDBy5uY4wYZKBUq5YrZJQjksWa3CPCI5mPb
         zyZXSL3qZUrGmlGUMKf7KAg+1SyqEAT0IGxyfjqBP382+iNn4IaVbSj+R3z/sdlE8ts0
         OW/A==
X-Forwarded-Encrypted: i=1; AJvYcCVxN+4RIsJFs207fL9A3F8Mv7IDY2Dj3/2ca8o/Zqi7/k0Nzx33upN+45JKbJbNUyw0QI/JIA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZHbEwpyX6DsLyBsCiRTKrc8aCWuZz1JDrT8XwhFK1XS/Mc98A
	mMl75DRf408kWXggQ1hq2G63RTYYVnkwDv4GliiJpwoKPDgsrdzeknVXTeBE5Wg=
X-Gm-Gg: ASbGncsmuH2V7rs4zrXxkfTkrLemGtNXaCnyVZTxR7+pPkYapYVaArQQf4yPbx7RCWG
	S1NZ4myknzNSrr3r7SunNxDmxAxYjIk1GKRohL0oroD2UJ4jJODPECfJcAIOQfdMf295pKVX4t5
	rhiF031X2vg+1kvMMRfxq+QPOFli/waTCe5y0ZZXl3RklKKG3rBwQxsGbfJdFS5Etv7pKHqWzHe
	tM2vM9H7+9pxw9EFTzWKsJ9OGK7VhMaOelnZu99gJmx8WOo2PAZbDed4RkonFMyeN/OVAdSZa1F
	NrLqUCe4XCVO23isga6NFwiLshIPnjNQXS8CtFh73u8=
X-Google-Smtp-Source: AGHT+IEPdF7TEMEPsBlbKy0LICAaKI5tSy/hvaMwPsy/0iACmx4P26wxRXBvDW6KHmSYeJXA9kBcqA==
X-Received: by 2002:a05:600c:1c0b:b0:439:873a:1114 with SMTP id 5b1f17b1804b1-43f1ef33982mr29289245e9.6.1744212616063;
        Wed, 09 Apr 2025 08:30:16 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c817dsm19339265e9.23.2025.04.09.08.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:30:15 -0700 (PDT)
Date: Wed, 9 Apr 2025 17:30:13 +0200
From: Petr Mladek <pmladek@suse.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Aditya Garg <gargaditya08@live.com>,
	"alyssa@rosenzweig.io" <alyssa@rosenzweig.io>,
	Sven Peter <sven@svenpeter.dev>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Aun-Ali Zaidi <admin@kodeit.net>,
	Maxime Ripard <mripard@kernel.org>,
	"airlied@redhat.com" <airlied@redhat.com>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	"apw@canonical.com" <apw@canonical.com>,
	"joe@perches.com" <joe@perches.com>,
	"dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
	"lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
	Kees Cook <kees@kernel.org>, "tamird@gmail.com" <tamird@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	Hector Martin <marcan@marcan.st>,
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>
Subject: Re: [PATCH v4 0/3] Use proper printk format in appletbdrm
Message-ID: <Z_aSbrS1hk8nltqc@pathway.suse.cz>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z_ThPOOKXa3VwvmO@smile.fi.intel.com>
 <PN3PR01MB959761E1B759183D83C1AC33B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z_TuqoRpTrjN07zo@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z_TuqoRpTrjN07zo@smile.fi.intel.com>

On Tue 2025-04-08 12:38:50, Andy Shevchenko wrote:
> On Tue, Apr 08, 2025 at 08:52:10AM +0000, Aditya Garg wrote:
> > > On 8 Apr 2025, at 2:11 PM, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > > On Tue, Apr 08, 2025 at 12:17:13PM +0530, Aditya Garg wrote:
> > >> The vsprint patch was originally being sent as a seperate patch [1], and
> > >> I was waiting it to be taken up. But as suggested by Petr, I'm sending
> > >> them via DRM.
> > > 
> > > You need to do something about your tools, really.
> > 
> > Uhh, I'll just revert to the tried and tested macOS mail.
> > 
> > Although I don't think a resend is necessary here now.
> 
> I dunno. If people are using `b4`, it might mess up the patch ordering,
> I haven't checked this myself (it depends if it takes [PATCH x/y] or message
> threading into account first).

JFYI, it seems that b4 handles this correctly. AFAIK, it checks the
[PATCH x/y] in subjects.

But I am not sure what DRM guys are using. I guess that they are using
patchwork. I am not sure how it handles this...

Best Regards,
Petr
