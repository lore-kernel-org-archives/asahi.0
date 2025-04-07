Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560F51F4C93
	for <asahi@lists.linux.dev>; Mon,  7 Apr 2025 15:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744038571; cv=none; b=F3aGqW79OObWkkczHDkuC4cOJ0j/LNH1ZmSMfMaR/3n2J139It9Cs42KmSm3/BtOqaJ/OASGDG62G/BOG0BRwr7uN39hvb7I+hqF4AeGoARHgpYmvbdnnClJuSom9i79ZYNx5w7K6ocENJ2F766k9UYe/lGWC45AgcI1hd5q+/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744038571; c=relaxed/simple;
	bh=QFbdEg3bdlWihK/atjI8KG/ClwBZaCMNkaOsxbUVO+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QVT2LETAKd4X4hCzV02NKeHg/9KlICRH0MCxEvaU92F01pVElMLpaFIcOOv3VoYtZrqITZafR9kwF0o9jCC3C3HZN4pR5AzZhBHKEqbz0JW1nAuqP5L5mFGU5zscFZbeY59SP9rHt9MSemRrXs1qmAkilUNmkrRs6f+5amY6KYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GHWaM3jd; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GHWaM3jd"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf257158fso31390505e9.2
        for <asahi@lists.linux.dev>; Mon, 07 Apr 2025 08:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744038567; x=1744643367; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bmsPW/IuCIMhHuegXao26Op7RdiU2z6+4rii+HhvEQg=;
        b=GHWaM3jdCOsq0YkdZu10xj3rbhfG+PV0lZM8wKMTjuWeM+Qt9RD9wyonK6H+tlUAor
         A4vYZ19rIXjC3KU/2fbD1qWDWIA8TppiXtrhHeVC731HxptVRZPFd1Ki+PHHjhAmzN+O
         Cscw9nMUy3C3mU3oLJ6G8aadLz5JstfUIB6CaxV024K5gGqP4GiMgNS7INQsns/W154C
         VrG08loqGD0q6V1PD7/7dROFSrr38bwVK+lxQtJ4JShWe9mUhbaAy+FJVurIHnkijee0
         IjI3nXLjnbBuMnX0KwSAAFJgt9VMxgRY9OpG0ZwRsK8c3Lr2ECFBm1ANPqeqls2XPCwk
         DsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744038567; x=1744643367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmsPW/IuCIMhHuegXao26Op7RdiU2z6+4rii+HhvEQg=;
        b=kZRZfDDvfmiN37eJyvj2uC+8M9j2nEVtmfL966FuUdus1lxz6i66yITFn7Tb/ptuWB
         3aOYCFmOqVELUQKrmR2Gc4T5DVOd3/7KiaIYdiIwT0DT1IoDKG8VHmpZYSBPbO5Jluau
         KHNT+qA8/lW8QnMdcPlGG2ShqSdYwo6YpZoO6Q9u7aFtX5oq3+ZC53cdjRyrly+GGdqG
         E3Oa4W7gQAaHZwQ4mn9mO+I+l3kbIO+dR0HFxsMKTt627889r8qRktPhE7nfw4iBxAk5
         l++ZvTfI8aW6XTfoNcQ/SNuoKCVCCXNfBYcr/zlZKF21fa/xOzxGMenUl+zQtqyaCSHE
         A2sA==
X-Forwarded-Encrypted: i=1; AJvYcCXORpfXhzS8cmnM2CYIXRHSWYF4BihuuNYP3GOVJ4GIPbEAeNCeG8vAnzTiKQuzF8+ew6Yg1g==@lists.linux.dev
X-Gm-Message-State: AOJu0YypD1Eob3XLhE/UvaNGOXKcZg6uK2Qc5oFph0HWQDnLhSKdkRff
	fJX/FLpMImEKStH4PiEmx4GZ61LqGi3CVDA1pH/2tgfehIa8HPJmTB1t53+BcZc=
X-Gm-Gg: ASbGncsmR4EuO1StZLFNaY7mmmuEaqlcZ5YWi/iCGdFuJABVQC0B5cz0C3zXgZOCi31
	wjZgUmlJl7/kVh+gSi2KlVeye7gnNv/QGvgXLYIW/aHJcveJkA3AwsU3Q+NZYAsRPGpB3EqMv3Y
	IY0M0JVC3nKtA2iPdjv78he5OT3ziCM/tRFPgZLDhv8+ExlCl8kEvCNk/tePKY28UFmcubpRVlk
	ORfIXoFCQtkdzxBQ/yMAUBPwHUsDj5IwB9YyYxJv90vHA+qhaJXFJRA+fnUUsJZ1wKQcnLuVXNY
	Gcisd2RvRUejTQea3p70gCHG8vTaX45r5sLzzbErTr794JQ=
X-Google-Smtp-Source: AGHT+IFKtcPtXIriIebz2GLDNpcyLtI8/d7dTMWyJquEPgAhC6jN+Ozp3zBNOoKwt9alXNTrbKHNiA==
X-Received: by 2002:a05:600c:4fc6:b0:43b:cd0d:9466 with SMTP id 5b1f17b1804b1-43ecf86ab8cmr107340865e9.9.1744038567238;
        Mon, 07 Apr 2025 08:09:27 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1660bcesm135136305e9.10.2025.04.07.08.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:09:26 -0700 (PDT)
Date: Mon, 7 Apr 2025 17:09:24 +0200
From: Petr Mladek <pmladek@suse.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: alyssa@rosenzweig.io,
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
	Asahi Linux Mailing List <asahi@lists.linux.dev>
Subject: Re: [PATCH v3 2/3] printf: add tests for generic FourCCs
Message-ID: <Z_PqpEDTC0RPiPez@pathway.suse.cz>
References: <8153cb02-d8f1-4e59-b2d5-0dfdde7a832e@live.com>
 <PN3PR01MB9597E8833F0DCE0C7C360135B8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB959799C9C343A7F08E04158BB8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3PR01MB959799C9C343A7F08E04158BB8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>

On Mon 2025-04-07 19:12:39, Aditya Garg wrote:
> 
> 
> On 07/04/25 7:07 pm, Aditya Garg wrote:
> > From: Aditya Garg <gargaditya08@live.com>
> > 
> > This patch adds support for kunit tests of generic 32-bit FourCCs added to
> > vsprintf.
> > 
> > Acked-by: Tamir Duberstein <tamird@gmail.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Aditya Garg <gargaditya08@live.com>
> > ---
> 
> Petr are you fine with this here?

Yes, looks good:

Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

