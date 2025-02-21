Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994B4209F3C
	for <asahi@lists.linux.dev>; Fri, 21 Feb 2025 11:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740138912; cv=none; b=dy6OGGxxRj2xgLZEYAKY0wiXxChZfB2HdsOmZ/Yg7g/fIwGT+nrXlGJqvp9hzva3V4WVdn38ekCJ/oOLH6UaNL2Z1OcWtidO65L5m+H0Aw+eXKvlnLKv2LTajC6wCnd963gGO4Rm01Ya9TNJu5Oia0TimwHdtuK/bF7wpQadZaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740138912; c=relaxed/simple;
	bh=o9hQaggU3Tdo3Rs75yT1Fva2Gn/BPjhpQH2KzuyJ2gg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G76r2HlDM0i5AaBYSbo8qtDgvmeYQDXyUjxyi5c8vMwocEqk/o8Gm9gipxnyFv9UaFiZecFXVq74TbTlh69l4UfDf2gfGPRjhvImaPKZQZY+smj7HgLzZMWmVZyCS6DcfEfuy8NZav4+ZjELHGxPMzYaL7JUn4L5a/EQuSvdpvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=RNytN0Zp; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="RNytN0Zp"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30930b0b420so17641001fa.2
        for <asahi@lists.linux.dev>; Fri, 21 Feb 2025 03:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1740138909; x=1740743709; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3/iRbyF06sKBSuXAXawsdJPOX5Xxar4Ru2tRuKb6D2o=;
        b=RNytN0ZpfuG94munnaCVUpW6Px/XIR5+TBtHH62JI4jvqhH69sSCOVsZpPZzftdkzv
         mvZR1EIgfzk0WHJz5uBDuGi3FMp6Ml2RadiIp6/0M7PXS0Z6xdBFyjt1fOamUdU6xs/U
         v9/e0uTIC8gPSDzFh3NAPG2FpS9mCautvJQAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740138909; x=1740743709;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3/iRbyF06sKBSuXAXawsdJPOX5Xxar4Ru2tRuKb6D2o=;
        b=SOoxA+t1/7qRuxTFsXnZdu8Yk70ZnsevnDbfArDc1VXC6mhjk8bZT1teh8YeW8eKsB
         /hzVe/PoOdtEUZiwUjjJBSUDDSI7fq9/vJQRLXR1NA5m3gsnyf4g+DNFymmUl5iMurmk
         3IwqGpLaH5h5KqWMLTak/1iTgx6XXkhYE9v4va6zh7fJJESDYF9sXTiSLSfWJQY5BZrl
         o4RmzPdL1/+cS6lnuISc/F4K0waiaLQQ2yRezuU/0/1vxTYDjvWElZa1yitbzYmfqkXQ
         EDVJrrhTimiQFWgWNUo7LEeY4ro7SwjK4NeXct6BVNtrltlqV/jnKkfYcMDVdfsRd9bT
         BytA==
X-Forwarded-Encrypted: i=1; AJvYcCUD8WOLoSLS9Mer+txfvvSMtSij04V/nlG/w6tWCbYkh0mwHHmnm0CxOKQVaToICtSSjBRtUg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzdUoumlFahybtk8OTMDrhegYsaT+KkDAve8ukYg4mgsKkaXsJZ
	3UwRhd1dNm6mtDLocuBa143WsQgAV6Trld0yhyHp3DH78RbDFPCA6pCEWTkqw7n8OY3+y0yoJ1b
	IBV3UgZHbP7Q8U9DFermL0KhqnrjVEnhkAkrWmw==
X-Gm-Gg: ASbGncvGy0Lg9AWSEab0cRaL+and+8AHDp2tpbt29BeEK4jo+jL05VM78vwj8qFw3zW
	l/aiXEZ6EQp1G33I6ic8W2/C85xW1SiB9ekyehrVeQyqq9hC9q8QFdFkHtjAr6Ios0rFeMX1o1W
	i+KKgP5Nk=
X-Google-Smtp-Source: AGHT+IGq/dIo+A2JknCfxBPtCWEXSb1e8s5WLFM0DZHAgz+xRkivavGxrBcVWQ1kfkiIjnKC8wn9G/O8JUziZ5NiZwc=
X-Received: by 2002:a2e:9b97:0:b0:308:db61:34cf with SMTP id
 38308e7fff4ca-30a59899cafmr8679651fa.14.1740138908700; Fri, 21 Feb 2025
 03:55:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com> <98289BC4-D5E1-41B8-AC89-632DBD2C2789@live.com>
In-Reply-To: <98289BC4-D5E1-41B8-AC89-632DBD2C2789@live.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Date: Fri, 21 Feb 2025 12:54:57 +0100
X-Gm-Features: AWEUYZkag0YCbmK4501eSholWPOVfmEf5FjMGyae-nYt_GMpw1QMs3yS9iwYbxw
Message-ID: <CAKwiHFi_nngthth0wZkaPviVeS+8SWDtTw6gJcDAHCqiwXAG2A@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
To: Aditya Garg <gargaditya08@live.com>
Cc: "pmladek@suse.com" <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, 
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
	"mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>, 
	"airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
	Andrew Morton <akpm@linux-foundation.org>, "apw@canonical.com" <apw@canonical.com>, 
	"joe@perches.com" <joe@perches.com>, "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>, 
	"lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>, 
	"sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
	"christian.koenig@amd.com" <christian.koenig@amd.com>, Kerem Karabay <kekrby@gmail.com>, 
	Aun-Ali Zaidi <admin@kodeit.net>, Orlando Chamberlain <orlandoch.dev@gmail.com>, 
	Atharva Tiwari <evepolonium@gmail.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, Hector Martin <marcan@marcan.st>, 
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>, Asahi Linux Mailing List <asahi@lists.linux.dev>, 
	Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Feb 2025 at 12:37, Aditya Garg <gargaditya08@live.com> wrote:
>
> From: Hector Martin <marcan@marcan.st>
>
> %p4cc is designed for DRM/V4L2 FOURCCs with their specific quirks, but
> it's useful to be able to print generic 4-character codes formatted as
> an integer. Extend it to add format specifiers for printing generic
> 32-bit FOURCCs with various endian semantics:
>
> %p4ch   Host-endian
> %p4cl   Little-endian
> %p4cb   Big-endian
> %p4cr   Reverse-endian
>
> The endianness determines how bytes are interpreted as a u32, and the
> FOURCC is then always printed MSByte-first (this is the opposite of
> V4L/DRM FOURCCs). This covers most practical cases, e.g. %p4cr would
> allow printing LSByte-first FOURCCs stored in host endian order
> (other than the hex form being in character order, not the integer
> value).
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Aditya Garg <gargaditya08@live.com>

Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
