Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B9717980
	for <asahi@lists.linux.dev>; Sun, 19 Nov 2023 23:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shantur.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=shantur.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shantur-com.20230601.gappssmtp.com header.i=@shantur-com.20230601.gappssmtp.com header.b="3byG2A/i"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50aabfa1b75so711611e87.3
        for <asahi@lists.linux.dev>; Sun, 19 Nov 2023 15:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shantur-com.20230601.gappssmtp.com; s=20230601; t=1700435843; x=1701040643; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYWCkZlXJ4B0t6rFXA39fRpajwrYFlXimEjkUmpXzFQ=;
        b=3byG2A/i492WmDDKEB02bt6P6arlgt15kiPgpJFhNW+B1Pet6dvhvldT7yFxRYKzbI
         sVlZDrC0aN6K4THiqGmP1vSlfPn9rVfVJgdyc6rk8blXvoImdP4e9llSRdCI6OP6bW5g
         MjlZXqHJKlqKhD06k6iGpOy5VN6B07oQgUZ9grnhRj3zNsT0Foo0UfpzVj7zZQzNslh6
         n3Q7+ESvLKG9tdmzY17S5QyVZrOpohDEO4BilEq6HchrbthgftsgiXiMtqdS1w4FXZnz
         d6yb+rMbdsp4Jh1kdkp//NtJPHWxvVrNKapGS+1H7exiEujkAvNEVxXTeHnydZdSNSdT
         c+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700435843; x=1701040643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYWCkZlXJ4B0t6rFXA39fRpajwrYFlXimEjkUmpXzFQ=;
        b=bInhDDPMaaliBLJbKpaU/GIWoLV1KRxQi8HW9xPOXquTe/lkkaOJHMERo2OOCco5o3
         HYtkKCPpjU80ZxpGkkEXkEg8jgS50zVmSX8SJcChEuWlWR3cDmPg214m1Yxr6SivtlKd
         0Naaus5NbTdB8D18NR2ajCXcOva2EH2UIAjrW7GilZt6B0FCHRo8xqoAoiEzB6nk08eu
         gPudP995Jzpvg3UpfOoaurauyrytS0CBkGdSg8A7yPSqeK9dXim/3AVtDgmOwZJgW3cS
         Z4eCFqDDENmpflXZXNHHDl5wgyJWgA00yHestCadRTV/5EemjxQqLuR2nNoW+EYqY8Ib
         ng3g==
X-Gm-Message-State: AOJu0Ywg+RzhSHpJ2HU3LpRYMyIkbLuyVYabTWJItN5kew+VkQhRHX1Y
	S+kw6QzHf543kmUl4EdCPlWuYorvNzXN578Vs6Cw98tj
X-Google-Smtp-Source: AGHT+IGaWobzbnruFK6SIuZ0Sif5gBLZ6O8SQ0qbi+syjksWwBHN4pM57CpCbAWzXS7q+u8CjV1n5A==
X-Received: by 2002:a19:ee13:0:b0:509:1067:c20d with SMTP id g19-20020a19ee13000000b005091067c20dmr4672941lfb.39.1700435843708;
        Sun, 19 Nov 2023 15:17:23 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id p16-20020ac246d0000000b005068d6de988sm987568lfo.226.2023.11.19.15.17.22
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Nov 2023 15:17:23 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-507b9408c61so5003679e87.0
        for <asahi@lists.linux.dev>; Sun, 19 Nov 2023 15:17:22 -0800 (PST)
X-Received: by 2002:ac2:491d:0:b0:509:4a02:1205 with SMTP id
 n29-20020ac2491d000000b005094a021205mr3925668lfi.46.1700435842580; Sun, 19
 Nov 2023 15:17:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231027-usb-fixes-1-v1-0-1c879bbcd928@marcan.st> <fe844c63-0c44-469c-a4e0-f0e1f2ac63fc@denx.de>
In-Reply-To: <fe844c63-0c44-469c-a4e0-f0e1f2ac63fc@denx.de>
From: Shantur Rathore <i@shantur.com>
Date: Sun, 19 Nov 2023 23:17:11 +0000
X-Gmail-Original-Message-ID: <CAHc5_t2WFZH65MJENGvC6u21ETcRn47ceQd8jrHV9DVmmM10Vw@mail.gmail.com>
Message-ID: <CAHc5_t2WFZH65MJENGvC6u21ETcRn47ceQd8jrHV9DVmmM10Vw@mail.gmail.com>
Subject: Re: [PATCH 0/8] USB fixes: xHCI error handling
To: Marek Vasut <marex@denx.de>
Cc: Hector Martin <marcan@marcan.st>, Bin Meng <bmeng.cn@gmail.com>, 
	Mark Kettenis <kettenis@openbsd.org>, u-boot@lists.denx.de, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 19, 2023 at 8:08=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> On 10/27/23 01:16, Hector Martin wrote:
> > This series is the first of a few bundles of USB fixes we have been
> > carrying downstream on the Asahi U-Boot branch for a few months.
> >
> > Most importantly, this related set of patches makes xHCI error/stall
> > recovery more robust (or work at all in some cases). There are also a
> > couple patches fixing other xHCI bugs and adding better debug logs.
> >
> > I believe this should fix this Fedora bug too:
> >
> > https://bugzilla.redhat.com/show_bug.cgi?id=3D2244305
>
> Was there ever a V2 of these patches I might've missed ?

Is it this one?
https://patchwork.ozlabs.org/project/uboot/list/?series=3D379807
