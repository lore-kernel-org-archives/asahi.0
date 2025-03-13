Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8DA268FEE
	for <asahi@lists.linux.dev>; Thu, 13 Mar 2025 10:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741862920; cv=none; b=BOO1/2hUWHpHXyC25pKt+4dsKfE36/BQTYZz6EY5ZWIorF46lSphakBI/I5P1zGvZRaHssHwYm2fKFXpVBXAXS615Sxqzjf6j9NrZFvr2tIWCZwMkO6Fq+jR53WKA0BLdtWlNhZp1lj0xIbYan87qgoJd+gCcBI6xk+iqek4vqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741862920; c=relaxed/simple;
	bh=zEa2/6ZbYMtLXc0GQf4ghQrBvlaLDMechFGbdAdGPCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFHPtOOe0nEsPg26z4AzyGkQqVHJqP74nlhRL0hhxuWFh7//f0m52dotZpx2hALv02uybPkpyF1HnVpge1t+ybsgkUrNqtfA5sb4sQ3WqmfZsEW5p1axZ1NvQ2+OnncdMp6MN1a9ATp9eUj4kjXaRpaJomGTJbPEInnXGP0QRus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=c2/Gasf7; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="c2/Gasf7"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3912e96c8e8so451375f8f.2
        for <asahi@lists.linux.dev>; Thu, 13 Mar 2025 03:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741862914; x=1742467714; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eB5vcLE8SQfGumBXnzHAeXBgedPPd3tI3SPBGaHjDZo=;
        b=c2/Gasf7hNZwG5cr2zP7N7cqZWUYvL5bcfquQ+o05pBcLHgDdoPSHENUVVMvjDmAJ/
         FFMlGWWE5/NHcCRFDIAUI6Sd2582/FgYfwDStLGajEmk/U0th7G82TMgD8uK1uQFVmfu
         4GRF09hdAaLhwgT4MUUZ64YydoBFx1GKDGV4DtnqAx27J6PXy8o7eA4Yw8PKlPojmAwh
         q4hH1Z/V7t+NHC0h1bfIKt5ZBzo3Zn2j9nOpTb7ZJ33CldSY5buflI8HLG1Y3oIQHqzF
         KRx96YDFPk1gbNf52OEzVtpKhypEFmK6N2nAvveULl357vgRvNpryeSc3fYgE9J+PFRX
         6ZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741862914; x=1742467714;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eB5vcLE8SQfGumBXnzHAeXBgedPPd3tI3SPBGaHjDZo=;
        b=ZU2MzjVwAa2056kN1x/EpBMKqSR6VZqKtRkafNzg1msCURWQm2uKiO/n8OBvg46Ynj
         8QiAdTQ6Ww+mYS4HRFNYimIVlmISHyZ5jO/Dtw+hcQvit4ojYrUsdFLAIsG10kN3YmTb
         0wkZnsTO0rDU9Ym+p7gL+WuiznA0G0WWLBeLVW9Cuv0S65tVYjegUeUl/0TggUrq3tzf
         QFFPb/hoih3x6stWOtv4LTq8P9L57njrjcJl/IC6pYVnkvZi8KTYp0nU6J2EtbVk2Oxy
         d61wiQk2u1Vfa91/GifAp/TvcIeNxuKbztZiVLLwO0bjo8FkQlUxaE17A5M+K1RJMzoe
         DDVw==
X-Forwarded-Encrypted: i=1; AJvYcCXl+JYNbevR7IhdB016LspoD7UIwjQSQ9r9tcMl2020OX7IPYD5+f+n6vUKCOMU4VqHL9laSw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyeBDRslt4xlmXHDZyIw2WxXZVsmmFhtU1hDK9UAf45cfDMfj6G
	7up0lzn55pMx7nwbmSYqCXf2SuVF8qf/0yOmQbOHVOqGHjEfA1ynvxoHmIxuw7s=
X-Gm-Gg: ASbGncuG4tesTx0pGac8Ko8OPrq8tpNJJnsLludGl1Z2RNBO1/+RL9WTd8glxwVKGOU
	P2WgKpvI2kUproTW9mqueCwqLhyd/43/6p9Ir4/Shqllr1124FN3c3c/7MjXssCZ0lztQRRSI2H
	afH93TQufufUxMOidWo3dc6m8yRhCtneo/bTFHcGZ9bdl0GeJyoJpVClCvJJDhd350lH/iYCLlV
	LKuZ4KOsLe85K+QUMWDpc5x1t8putZtA7fnXt8Cj7OExaWWiq5x/148j0gIhOo2PGSpLOcfG3dy
	yLtUWDNa2aOyJ7DuefVA2oSbsRjNU8p1+oPASTlyf8m7NVE=
X-Google-Smtp-Source: AGHT+IFm7Kuzlt4RWV1h9LdE/z3iVTyMjzOwOXxoRSiATKcU+lu5J0yjCPWicWOanc5m4AYOR6rZGw==
X-Received: by 2002:a5d:64c3:0:b0:391:31c8:ba58 with SMTP id ffacd0b85a97d-39132d16dd6mr21931727f8f.10.1741862914526;
        Thu, 13 Mar 2025 03:48:34 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b7656sm1673700f8f.40.2025.03.13.03.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 03:48:34 -0700 (PDT)
Date: Thu, 13 Mar 2025 11:48:32 +0100
From: Petr Mladek <pmladek@suse.com>
To: Aditya Garg <gargaditya08@live.com>, Kees Cook <kees@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"apw@canonical.com" <apw@canonical.com>,
	"joe@perches.com" <joe@perches.com>,
	"dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
	"lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	Hector Martin <marcan@marcan.st>,
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>
Subject: Re: [PATCH 1/2] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
Message-ID: <Z9K36SRz7Ja_AyQb@pathway.suse.cz>
References: <9092a9ed-aecf-40bd-9d15-b53d60d035b5@suse.de>
 <PN3PR01MB959715C19BCEA54426D24934B8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <ff3a9c58-5c7a-4c48-8a9e-cc828a43baed@app.fastmail.com>
 <PN3PR01MB9597E5C609290DB1A967263CB8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z9HgVn-XELC065w0@smile.fi.intel.com>
 <47AE7FCD-0F30-4379-ADE9-090A15ACD58F@live.com>
 <Z9Kb8zMJgmSP-rgD@smile.fi.intel.com>
 <PN3PR01MB959780176C0B16C36FBD59C3B8D32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z9KdzZUxs3vlwp0Z@smile.fi.intel.com>
 <PN3PR01MB9597A8F02423B9E4C585F5EBB8D32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3PR01MB9597A8F02423B9E4C585F5EBB8D32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>

Adding Kees into Cc to resolve how to get this patch into the mainline.

On Thu 2025-03-13 09:13:23, Aditya Garg wrote:
> 
> 
> > On 13 Mar 2025, at 2:27 PM, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > 
> > ﻿On Thu, Mar 13, 2025 at 08:53:28AM +0000, Aditya Garg wrote:
> >>>> On 13 Mar 2025, at 2:19 PM, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >>> On Thu, Mar 13, 2025 at 07:26:05AM +0000, Aditya Garg wrote:
> >>>>>> On 13 Mar 2025, at 12:58 AM, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >>>>> On Wed, Mar 12, 2025 at 07:14:36PM +0000, Aditya Garg wrote:
> >>>>>>> On 12 Mar 2025, at 9:05 PM, Sven Peter <sven@svenpeter.dev> wrote:
> >>>>>>> On Wed, Mar 12, 2025, at 13:03, Aditya Garg wrote:
> > 
> > ...
> > 
> >>>>>>> I don't have a strong opinion either way: for SMC I just need to print
> >>>>>>> FourCC keys for debugging / information in a few places.
> >>>>>>> 
> >>>>>>> I'm preparing the SMC driver for upstreaming again (after a two year delay :-()
> >>>>>>> and was just going to use macros to print the SMC FourCC keys similar to
> >>>>>>> DRM_MODE_FMT/DRM_MODE_ARG for now to keep the series smaller and revisit
> >>>>>>> the topic later.
> >>>>>>> 
> >>>>>>> Right now I have these in my local tree (only compile tested so far):
> >>>>>>> 
> >>>>>>> #define SMC_KEY_FMT "%c%c%c%c (0x%08x)"
> >>>>>>> #define SMC_KEY_ARG(k) (k)>>24, (k)>>16, (k)>>8, (k), (k)
> >>>>>> 
> >>>>>> That seems to be a nice alternative, which I guess Thomas was also suggesting.
> >>>>> 
> >>>>> I don't think it's "nice". Each of the approaches has pros and cons.
> >>>>> You can start from bloat-o-meter here and compare it with your %p extension.
> >>>>> 
> >>>>> Also, can you show the bloat-o-meter output for the vsprintf.c?
> >>>> 
> >>>> Here are your outputs:
> >>> 
> >>> Thank you!
> >>> 
> >>>> ---------------------------------------------------------------------
> >>>> For appletbdrm:
> >>>> 
> >>>> aditya@MacBook:~/linux$ ./scripts/bloat-o-meter $P4 $MACRO
> >>>> add/remove: 0/0 grow/shrink: 1/1 up/down: 64/-19 (45)
> >>>> Function                                     old     new   delta
> >>>> appletbdrm_read_response                     395     459     +64
> >>>> appletbdrm_probe                            1786    1767     -19
> >>>> Total: Before=13418, After=13463, chg +0.34%
> >>> 
> >>> This is enough, no need to repeat this for every parameter.
> >>> 
> >>>> ---------------------------------------------------------------------
> >>>> For vsprintf:
> >>>> 
> >>>> aditya@MacBook:~/linux$ ./scripts/bloat-o-meter $OLD $NEW
> >>>> add/remove: 0/0 grow/shrink: 1/0 up/down: 220/0 (220)
> >>>> Function                                     old     new   delta
> >>>> fourcc_string                                479     699    +220
> >>>> Total: Before=26454, After=26674, chg +0.83%
> >>> 
> >>> So, we get +220 bytes vs +43 bytes. It means if we found 5+ users, it worth
> >>> doing.
> >> 
> >> Will it also depend upon the number of times it's being used? In appletbdrm,
> >> it is being used 3 times. Probably more in Asahi SMC.
> > 
> > Right, it depends on the usage count. Also on different architectures it may
> > give different results. On 32-bit it probably gives better statistics.
> 
> Best to go ahead with vsprintf then. Petr, are you still there?

I am here but there were many other things in the queue ;-)

I do not have strong opinion. I am not familiar with the FourCC
format and it looks like a magic to me. But it seems that it makes
sense for the users.

I personally find the %pcX modifiers a bit less hacky than
the two macros SMC_KEY_FMT/SMC_KEY_ARG.

So I am fine with this patch:

Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>


Now, the question is how to get this patch into the mainline.

Normally, it would make perfect sense to queue it via the DRM tree
because drivers/gpu/drm/tiny/appletbdrm.c is a new driver...

But this time there is a conflicting patchset which is reworking
the entire lib/test_printf.c file, see
20250307-printf-kunit-convert-v6-0-4d85c361c241@gmail.com
And it will likely be ready for the next merge window as well.
I am going to review it right away.

It is even more complicated because the patchset converting
the printf test module to KUNIT depends on another changes
in Kees' tree (moving kunit test modules to lib/tests/).
So it might be easier when it goes via Kees' tree.

And it might be easier when even this patch goes via Kees' tree.

My proposal:

I suggest to separate the fourcc_pointer() test update
to a separate patch and add it later after the merge window
when things settle down.

I mean to send the vsprintf.c, checkpatch.pl, and doc update
via DRM tree together with the new appletbdrm.c driver.

And update the selftest later when both DRM tree and KUNIT
update reaches mainline.

How does that sound, please?

Best Regards,
Petr
