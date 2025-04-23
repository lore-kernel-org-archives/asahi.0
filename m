Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8038254AE3
	for <asahi@lists.linux.dev>; Wed, 23 Apr 2025 17:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745430866; cv=none; b=gQ1lpTsH5vJJxcVCpY0TU4KPwwi9Q30VKrouGLWAxmCwOyeMqJEw0CMd8G8hl95hVLozZlGOvfPwzx6oW+piuE84/qXxdsWRlLZvdmZTZnDknxvpW+PsDlVQm+VB5Y4ovq6C5MArITg3dabf361lz+vgBJccfVN11ABBgkbUJdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745430866; c=relaxed/simple;
	bh=mUzTTN/4NXsdcyMh1iWWXDct71g5yfltXc88uy92cmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RqTsRNkgWit2i3+qn5fKDwPR5roAQv4dDU+ZqUknqvEyDB129AiM7Q0mlUmWm/XP1JT85oNPsZQF++jV/6s6ERq6JZbpUMqvV7W9gipRNErUNo69vaTsWuNH0u/eqUr81MSlfN0zGxcY1xUZs/guucy9wyq+OmC9x/mvtcfcvaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-224019ad9edso1413385ad.1
        for <asahi@lists.linux.dev>; Wed, 23 Apr 2025 10:54:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745430863; x=1746035663;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wLqipjscszx2Mp0FY64qeFZMiD5TTEV8hZP6rO4hjpA=;
        b=fmEI0dPnnTOYq6WrQIdbgpz0BWc75ewKhEWnK7dGZJ731PyBUrCAR8HZJ6EX7LBqWX
         1BfYn3z8Sx+ThzGsa1/+82K4AL0caGdd8ur+Ujkes5AqFI6mpRI/yoi64zeyeXWVgIjZ
         agSytM2vLT9gnEEAlA/Fv53eonDdwzR4wQwHU/3i13dBdHVMbOnllvDoWT2BOUVOpdEX
         1gDEFKJI5ItmDu2LDQRcapmRZYqPc9W9RfSbTRGnLdBOH6fUHSqbRDJOES4KIGXB6oz9
         ODJqP4fzY49XURegKG+Yqc0rCgsck4vB85MCxk5CV5a98/h7xFRIKqZP9lwS+gaRpNtu
         pteg==
X-Forwarded-Encrypted: i=1; AJvYcCVavy5ZyLqJc8B62lbY1thcZput3qY4HcuCxrhQHimJOSgJ4iz66Pivm6zE+HN5DTLtDroTuw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3HgCvM76uBvgSYCPs2DNTjCPxZ7g+9KG3o6tG3BNktlikP91S
	elG2NpVDhBRKBJDE3At6+9/ibH/PasYb2Qfm5ijsoa3r5wVQrylqPbTuoUuniQ8=
X-Gm-Gg: ASbGncuHv1SN5izhGY9Y/6zIqgSzvJEEnFCRpn+3Qi4bnSLDBOAvijokCeemc1HIORU
	Sb+udCuw/FFy1nnv3YojVNy+Qu+U02/JxjOlMEJu6UkMS/9IeFP1wWy1FTaJ67Q4BBoO1RXHqCS
	wjzvszqHnmxGW2l3czWEHc7aOLe+dLwWxe0Eu4wzDcuSS17iMxfPO/iZG5zHPkxW0oXmshTNjMa
	cUa4cS7rPU6ETtXkFES6z+iWNzRjfeh6lUi+VEQvUs52zdeMKKljtwTy/JW14nUS6Mx93ouaL7A
	snjXtYq3S/9lTpz8+f1SWoOpvO/ScybU7XDXUOEfJbA8+8g0/ElncY1HH0wPi77TOuqcCQLFEE1
	k3EoPmtqOVgEigU4qrQ==
X-Google-Smtp-Source: AGHT+IGH5QxDiqQV3847IRr/WOfcqtoqCzihXagjY3NRTdaDyMnL1U61Xq1pb9+IuwO8cUqxnUMoFQ==
X-Received: by 2002:a17:902:ea03:b0:210:f706:dc4b with SMTP id d9443c01a7336-22db1a8d74emr3747095ad.13.1745430863556;
        Wed, 23 Apr 2025 10:54:23 -0700 (PDT)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com. [209.85.215.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bf30f3sm107814175ad.59.2025.04.23.10.54.23
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 10:54:23 -0700 (PDT)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b041afe0ee1so45108a12.1
        for <asahi@lists.linux.dev>; Wed, 23 Apr 2025 10:54:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUNKqDRbUT5A7HDnpAwQNRWkazNlKb0kwak7aMAXNwaUNfwRg2gN5cdN7CZBtz5WjliCrzuUg==@lists.linux.dev
X-Received: by 2002:a05:6122:2a02:b0:529:f50:7904 with SMTP id
 71dfb90a1353d-52a76b54183mr283580e0c.9.1745430411699; Wed, 23 Apr 2025
 10:46:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597B01823415CB7FCD3BC27B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com>
 <PN3PR01MB9597B3AE75E009857AA12D4DB8BB2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdWpqHLest0oqiB+hG47t=G7OScLmHz5zr2u0ZgED_+Obg@mail.gmail.com>
 <aAjthvTuIeUIO4CT@pathway.suse.cz> <CAMuHMdXuawN0eC0yO40-zrz70TH-3_Y-CFSy6=hHCCMLAPvU5w@mail.gmail.com>
 <aAkVcaRrMmqXRSFz@smile.fi.intel.com>
In-Reply-To: <aAkVcaRrMmqXRSFz@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Apr 2025 19:46:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUUkhJm++zitVRQdSHJUo9McjYGeVz4Frv2sct_Can+aw@mail.gmail.com>
X-Gm-Features: ATxdqUEiZpgKy-OUmSil13Kt3gOTH1qjKd6FZI95GjTyFDCgENU6kR4WqaMubEM
Message-ID: <CAMuHMdUUkhJm++zitVRQdSHJUo9McjYGeVz4Frv2sct_Can+aw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, Aditya Garg <gargaditya08@live.com>, 
	Hector Martin <marcan@marcan.st>, alyssa@rosenzweig.io, Sven Peter <sven@svenpeter.dev>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Aun-Ali Zaidi <admin@kodeit.net>, 
	Maxime Ripard <mripard@kernel.org>, airlied@redhat.com, Simona Vetter <simona@ffwll.ch>, 
	Steven Rostedt <rostedt@goodmis.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, apw@canonical.com, joe@perches.com, 
	dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, Kees Cook <kees@kernel.org>, 
	tamird@gmail.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	Asahi Linux Mailing List <asahi@lists.linux.dev>, netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

On Wed, 23 Apr 2025 at 18:30, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Wed, Apr 23, 2025 at 04:50:02PM +0200, Geert Uytterhoeven wrote:
> > On Wed, 23 Apr 2025 at 15:39, Petr Mladek <pmladek@suse.com> wrote:
> > > On Tue 2025-04-22 10:43:59, Geert Uytterhoeven wrote:
>
> ...
>
> > > The problem is that the semantic is not the same. The modifiers affect
> > > the output ordering of IPv4 addresses while they affect the reading order
> > > in case of FourCC code.
> >
> > Note that for IPv4 addresses we have %pI4, which BTW also takes [hnbl]
> > modifiers.
>
> Ouch, now I think I understand your complain. You mean that the behaviour of
> h/n here is different to what it is for IPv4 case?

Indeed. "%pI4n" byte-swaps on little-endian, but not on big-endian
(remember, network byte-order _is_ big-endian), while "%p4cn" swaps
everywhere.

> > > Avoid the confusion by replacing the "n" modifier with "hR", aka
> > > reverse host ordering.
>
> Not ideal, but better than 'h'ost / 'r'everse pair. Not giving a tag and not
> objecting either if there is a consensus.

That is worth as much as my LGTM ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
