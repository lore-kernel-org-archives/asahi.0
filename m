Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28F3214A9B
	for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 18:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740076941; cv=none; b=JyNp7PSfUx7ZYOT6HCDHo0wIhQxUD2whjvkca2NhjjLO393I+JtWkxJvvKPICBO7pBTrtfNU528iRlVQho1UTqekIoKU1mMrMf0FOhwiU7dAQLDCVaf+fayfAircxhIHAbKSqYopxrAf+XFs/ZFvQUVbOUebDNDDb8ev8E6VvkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740076941; c=relaxed/simple;
	bh=lc4tYVIXad/mhyoDCTa+KlzbPNoPTYdJb9IQsP+eoT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=biTPlk4+/Lfq1wy+4fr2GfrJl196r/UR2vAEU6FeF9hsBnxQVpORRLr9Jp0fMo2I16VKKiBUrZtbCJYiT3Zm43gwI1b/3yM0+ZhSyvoAoch9ZdKlonxOynHHNzP2EWD2KmhpAKtaKM0HZP0CoIWLRjKRgkCJ5x+rU6H3pOpSPL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54529eeb38aso1055593e87.2
        for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 10:42:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740076938; x=1740681738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lc4tYVIXad/mhyoDCTa+KlzbPNoPTYdJb9IQsP+eoT4=;
        b=JKBEXsfL2sAb+TQGIvX9hGrndayU1IoHsdko5YftfHEKL925fZS3GATEUGh6hrVuxY
         xjEPJ6dC3qiEBePlbt8oFqC8neQZ6NgwahVm3OUXrNKrh6r+C2WmPsc5ZdVmOawYennp
         AcwA8MNBrBhztdJ4Ss2pFx7g9ZCeT/BAUidjqEL/c5yApUv9Hg2eAiNxOnvmos+P5y2k
         cJqVa8mh3bXtK/Oq6rU8p4jwU3XpJS3WSqMumUL7G5t956wU1cOYQNk7PRuhQsMqvwnl
         VKQXo3pylPgwp+E/Ma/C4vus6rvnQTSRVXEDOlR2MbggqJu2BHTaMs9HCpZ370fV402X
         /w4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX4LvzYrsL5tkvFduoS5wEyutK2ypK9W9cXfL/M83y4So/PPq/DQRBMTQY1tKijjNTqX8tUTg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZT4KAaHszwczFhaWSQRUrNdKSaAlMhvNsmIY1o6TO0S57twSK
	hVHLxEyNOU6KXgZ46Mdr+ZqVGWcdYdRwX9LcOf2ZASYlVnxXpB3Uzyu7ebCDX9/UeQ==
X-Gm-Gg: ASbGncujSuCB+G52eJxEpZULH/Hp91iujlp7i2teo9rYxqj6eD7KPxwhjQ8UGtwNoKt
	CHJtzj1UMziHAMxB9ZZJ3EjzYnkyO1iyuL7mCzIqJgUSZnXToSChFfaihfAFC5DcNQb2ymClCcM
	pN28exe10bMFuwUSSNjvAmlC7gKxKfyPUN0uZbIBVtQSIAqYzY5cteMxErsZ2hRvfiqK3mtDXkI
	88BC9TTGsN1gNa9KZVtZVQKIUf5LhC+0HUA+Rxaut9qVOOihjOU9MY24s6Y0qlE+5k3wzCZSpf0
	wkdUqipf0+ecwQnBEH82mMmvwBVfK/83tDFkNV7yzKkTVw==
X-Google-Smtp-Source: AGHT+IEt4V68BAKkwJqMXyOnu2j16tdET4N5BQR7bgdUC/xNlT0pIyaGx2JdTeNpSiDuL90B1Tx9pg==
X-Received: by 2002:a05:6512:31d3:b0:545:22ec:8b51 with SMTP id 2adb3069b0e04-54838f5b09amr26605e87.41.1740076937651;
        Thu, 20 Feb 2025 10:42:17 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452fa9fc59sm1988492e87.131.2025.02.20.10.42.17
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 10:42:17 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54838cd334cso59357e87.1
        for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 10:42:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWdSAmgsyQ9KKYTTtBNPvy2ELmR14f2VjO550qf65VBBOLbIzW7aLFIuBvkx6WfnY2v4so2Cg==@lists.linux.dev
X-Received: by 2002:a17:907:7845:b0:abb:b322:2c4e with SMTP id
 a640c23a62f3a-abc099b3857mr45311166b.3.1740076521525; Thu, 20 Feb 2025
 10:35:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <716BCB0A-785B-463A-86C2-94BD66D5D22E@live.com> <1EFD4096-FB85-47BB-9952-E014E463DB1B@live.com>
In-Reply-To: <1EFD4096-FB85-47BB-9952-E014E463DB1B@live.com>
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 20 Feb 2025 13:34:44 -0500
X-Gmail-Original-Message-ID: <CAEg-Je8VaMGxztdu9+Uk5dFJeYaru=nFSZhpVczM79GaCYURkw@mail.gmail.com>
X-Gm-Features: AWEUYZmbr-UkiwBE7upLCEsKo9jbPsLOn6oegnKRI3ia0qci58WpHW4Q4ye6O0M
Message-ID: <CAEg-Je8VaMGxztdu9+Uk5dFJeYaru=nFSZhpVczM79GaCYURkw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/tiny: add driver for Apple Touch Bars in x86 Macs
To: Aditya Garg <gargaditya08@live.com>
Cc: "pmladek@suse.com" <pmladek@suse.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, 
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, 
	"linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>, 
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>, "corbet@lwn.net" <corbet@lwn.net>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
	"mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>, 
	"airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "apw@canonical.com" <apw@canonical.com>, 
	"joe@perches.com" <joe@perches.com>, "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>, 
	"lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>, 
	"sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
	"christian.koenig@amd.com" <christian.koenig@amd.com>, "kekrby@gmail.com" <kekrby@gmail.com>, 
	"admin@kodeit.net" <admin@kodeit.net>, Orlando Chamberlain <orlandoch.dev@gmail.com>, 
	"evepolonium@gmail.com" <evepolonium@gmail.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, Hector Martin <marcan@marcan.st>, 
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>, "asahi@lists.linux.dev" <asahi@lists.linux.dev>, 
	Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 11:47=E2=80=AFAM Aditya Garg <gargaditya08@live.com=
> wrote:
>
> From: Kerem Karabay <kekrby@gmail.com>
>
> The Touch Bars found on x86 Macs support two USB configurations: one
> where the device presents itself as a HID keyboard and can display
> predefined sets of keys, and one where the operating system has full
> control over what is displayed.
>
> This commit adds support for the display functionality of the second
> configuration. Functionality for the first configuration has been
> merged in the HID tree.
>
> Note that this driver has only been tested on T2 Macs, and only includes
> the USB device ID for these devices. Testing on T1 Macs would be
> appreciated.
>
> Credit goes to @imbushuo on GitHub for reverse engineering most of the
> protocol.
>

Can we credit them as "Ben (Bingxing) Wang" instead? That's the name
on their GitHub profile.


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
