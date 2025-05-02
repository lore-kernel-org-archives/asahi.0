Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E37823E25A
	for <asahi@lists.linux.dev>; Fri,  2 May 2025 13:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746192641; cv=none; b=Z6nAq9BNU/ujMIIgbaVzappNF7K8tNbCNDNR6xClLh0yhmLnwNUjSKBHHzaXbdMyBP27AfpQdqhR/qcMNk4iM3qwR2uXfr8cMmuKk157SShvj5++JvchWGEx87lHxK+cSL2EfppHosAivQTQAQYBQjVYybownSidNKXNs/US2Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746192641; c=relaxed/simple;
	bh=dOnI3ojRPOwkGTlZxJz/bQcxtl8BiIZwiuZeVEQYa98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IoWlXhGd53lRDUhbC3k1rcDlJIVUc4FjfMeYkmbzClSreTVJhccrTElnHtklPwL4xsxCsHCdtfg79Ed/myja76DkHSq3QzSr1Gg6MUJ5s/BY0ZIHZZtlLN1OOpUM9uUdyFVkZqNMjsXt5p67TUdgsV1XhsDf99GL4RF7mG1Em9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Nas6+4H+; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Nas6+4H+"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-acacb8743a7so358253366b.1
        for <asahi@lists.linux.dev>; Fri, 02 May 2025 06:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746192637; x=1746797437; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oI2ULQh5v/7XJgNEVII7Ar9c5ShGuV2fSObmZKZHKeY=;
        b=Nas6+4H+Yu0Gd9HkNDgQWRZrj2Vu6+F69LpSkEpB/9IQjrAk9H9nGxdTbxQ2QB9nNW
         yb5cCSf4LKruuP79nH0XHowU5m6l8tPhsJkHW4nOGMdZXfu53q2zMiVMeZFsoO5pG5Bh
         xVVqOyFXJKmhpIsU/V8ztRFWlx2iy+K1g+YO+TnLajpARDEOJGNh3Dh8u8RLEecJbRac
         GTV5EyXP0ly1WyijcjD0VNcgF4h/W9TLuS+o1tfPVSSEBhKqrl4ezDlbHp8FlYuvEpP4
         U/EgclUSHQH83jR0Mn2qwrsVT7ukLLbD0xTVULEpOaKkuYppmlsput1WagpKT6Fa/7FC
         K7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746192637; x=1746797437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oI2ULQh5v/7XJgNEVII7Ar9c5ShGuV2fSObmZKZHKeY=;
        b=E6qEL56WfYIrJi5kyXUH+lrrQH8AEfqf3IK8ZIW7D5h4pk8wXVzBRt6TGZk5d6DNKj
         koaErs1i2iQIRg1qgIolJNTJhVECYSZxWDf6PRpcq7WDoLRxB3o8aBTE/aQ3wBO0vPLK
         Ri8MjzFQVlBjAQROsoS/WatWt3xQYqM2RD9uwdcKID3IxDOm2zqLKa1SK7Y7lTIdrJ7l
         OK6zdi2puHsODN9pwvBQE9/miQuHSs9hF4VZeOCrtz+oiJfvsdsI9GebQytCOjs+lDpF
         2RL9rKY/F7Q0BFykPnfieSWci6TEKW5pmGgTk/duzYLJbrd/UnkV3CpAIXe1D7wfekbY
         WWCw==
X-Forwarded-Encrypted: i=1; AJvYcCXjjeQARkNYIBazJ2THRw94giT1ncnBJpvjhEMLJ8yJXG/cx7Q/km3NTino5HKOMeJ1omynEA==@lists.linux.dev
X-Gm-Message-State: AOJu0YypQeiBWmI12CZU5WWkvxYTuJ4kSFZD7TzY/FXHkpmcgqSAH6Hm
	rQ75R7yc1P/+rynWV2nsKtC66hSarCwi9UsZkNEWQCIuu0Fa24g0AiIfAwNtUaU=
X-Gm-Gg: ASbGncv/1SZdM4G+h7tZPYyziHrzFflQWJeCqeLVj7jLTtCxkz6qe1Vo9JGh2J3kBB+
	Rq0nBk0+3TH2WKSW7zn642q22D1RTqaqLu8kl8U/LRblo3TWed8qQNx5E/N3z07eOSLKy/HjP8q
	PcCTLkggsW0y6DUgok/EvaM6WEUev4BYK3P1UE6SKH9Bb/n8QKRdN96/fa7Wz33SCaZq3P3f8Mo
	R+3rJjSdHb0UJF9uQL71vNaaQqazJPsUCn3jIvnZGlKKdw8qXm7leodXoMeCXSMxjwhZ1Fd9r9W
	xZ9CTdoF6Q0SAE+/dUQXNw94l9NY7HGazYQ3K6bMKR/6qN532ckMxqUpAz3lHQ==
X-Google-Smtp-Source: AGHT+IGNjdWSsHUN82hvMxthq8y7vwBmvrJ6nrWhg8zsSPmK5nzcMmRdBKIMbJNC2QRWTDJHY7Fsug==
X-Received: by 2002:a17:907:c298:b0:ace:8176:9870 with SMTP id a640c23a62f3a-ad17ad88dc8mr244745366b.9.1746192636538;
        Fri, 02 May 2025 06:30:36 -0700 (PDT)
Received: from localhost.localdomain ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189540d5bsm50208966b.176.2025.05.02.06.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 06:30:36 -0700 (PDT)
Date: Fri, 2 May 2025 15:30:34 +0200
From: Petr Mladek <pmladek@suse.com>
To: Aditya Garg <gargaditya08@live.com>, alyssa@rosenzweig.io
Cc: admin@kodeit.net, airlied@redhat.com, akpm@linux-foundation.org,
	andriy.shevchenko@linux.intel.com, apw@canonical.com,
	asahi@lists.linux.dev, corbet@lwn.net,
	dri-devel@lists.freedesktop.org, dwaipayanray1@gmail.com,
	geert@linux-m68k.org, joe@perches.com, kees@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@rasmusvillemoes.dk, lukas.bulwahn@gmail.com, marcan@marcan.st,
	mripard@kernel.org, rostedt@goodmis.org, senozhatsky@chromium.org,
	simona@ffwll.ch, sven@svenpeter.dev, tamird@gmail.com,
	tzimmermann@suse.de
Subject: Re: [PATCH v3] checkpatch: remove %p4cn
Message-ID: <aBTI-v5-_JWDdge2@localhost.localdomain>
References: <20250428123132.578771-1-pmladek@suse.com>
 <PN3PR01MB95971954FC5E026C59B6F8EDB8802@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB959760B89BF7E4B43852700CB8832@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3PR01MB959760B89BF7E4B43852700CB8832@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>

On Wed 2025-04-30 19:19:08, Aditya Garg wrote:
> %p4cn was recently removed and replaced by %p4chR in vsprintf. So,
> remove the check for %p4cn from checkpatch.pl.
> 
> Fixes: 37eed892cc5f ("vsprintf: Use %p4chR instead of %p4cn for reading data in reversed host ordering")
> Signed-off-by: Aditya Garg <gargaditya08@live.com>

Looks and works well:

Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>

Alyssa, could you please queue this one via drm-misc-next as well?

Best Regards,
Petr

PS: Aditya, thanks a lot for stepping in and providing this patch. Also
      thanks others for shaping in. I was not able to react quickly. I
      had technical problems with my workstation and public holidays.
