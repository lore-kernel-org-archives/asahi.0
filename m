Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4757B349CC3
	for <asahi@lists.linux.dev>; Wed,  1 Jul 2026 14:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916376; cv=pass; b=IurDU27kenvAjM1ssE6VqKOcp2nGLT5f3vqhKUvCrk/zGat0X7seUIcUB7bor6sf8nU3nKuv1Z2REj4NfkLrF0aW5zKFUXPINe5FcYCQpppCsabSof9uGg3W2edMAjc5wKpQRgrelnbg6Uy32M7C4DGBPhxbIGpJnr7/HvyZ0Z0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916376; c=relaxed/simple;
	bh=sZ+JoBpUWCF0i/dfiNw2PzLfB8Xqm/+jouOkAHa0NR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N8W/fHHfUTCcvI2Khd3W26uv/Eu5r4WpZvdM3BVzf7tMUd8Ku7YBtrvuk/yYElQrU0iPWt8r0rI95EQvvgk4HuENcq2SYpFndYArFIMGuVCyRrDp1wHVIUVVVDGXld4/vTijd/xXDCbi5PT+0oYbt1ufNFfEtjsWoQ3uY3E+Ip4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIwE6EPX; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIwE6EPX"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-664ee752958so965561d50.1
        for <asahi@lists.linux.dev>; Wed, 01 Jul 2026 07:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782916374; cv=none;
        d=google.com; s=arc-20260327;
        b=Xg1f5okkAMJA3BQiF611+MEIqmSkzoPOkb0RNloBhdGeUh4mdxcXWF6Z5lxuVkTZb/
         H7W+DiTlLVsVflCNFMT6KcdR1jgOXGySv92QdbIgYh/8m/Ejq9yFjH0W78QGZNJDo2yy
         OwDC0Z4Xot/T9oNUDCC1l3AiMR5ljONEnIbUZViW7H38GA2Tg4vtYhIUWIw5vJn6Mn1j
         EpqkbL5EbtahSNg86mw2bffe7gVusa0dnmORejLvyTc2Lpy6XVRqsGPt3cgS7YlfvJ4s
         c8xK7n1DwfMk0TBzjA0FSp24wGYzrRONhckY396ltEYjDjojJ1grat0g/l0r5K/2ZpQi
         CKDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/PMJfwXDmjutwz2ZqUdHqOQ1qGXDhEDRkGoA21ZDRuY=;
        fh=z4px1UL8lefV2/2z9QhE6bd7k6juAxEgaEvYyhxDMmk=;
        b=BuO2XyPx57WCX9vpPF4BjjoJ0ID8jDY+iFAvmcm5z5+ks7Dh9kxRCBshPCj60PTRZu
         R6LYq+ycTRm6mBM8azLhggA7FYfKq6HuM0blhGCbqhNDKWUYsQZB0xqleC4wqAxfdlmi
         3Spi01mgsuRjAd24cX4SBmdgQwwhlv8gu48Fr+Gn/f0/0rN0suQk6ED9/Z+3aOWigslo
         WHJ5e5cpxup0pgOdgRkmC1DnUjnMJo8nL45s/j3MygPwmu7Nf+gS4w8ggGQV8qfCRw9v
         /Vej+w6/HIhDW3TX1KXafI9lINyE4fNPb8sL3LOa6WyzTR7iu8YtStIIFkV6YZGKMZaO
         uMxw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782916374; x=1783521174; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/PMJfwXDmjutwz2ZqUdHqOQ1qGXDhEDRkGoA21ZDRuY=;
        b=jIwE6EPXO1umJx6of1gHpwhDlsmthcYdKGr/rd8IKfLaQhmJRTVKn0qDOifLhZsae+
         ZT4yq9TlDfy4Gun5gSglyNy5LmaimF84ue8ojFw5KkfPq3SaWCmCsjdR1wsgo+3K5QF8
         E4wyX5yGmOCGtdeBSDtzEUYzhTX41Y4bFTh2YtFjwm9cxh1A3ZO8PXNsCD7UvXxmRfgi
         chy6DzgPX5P9APBZAnJ3J79sRt3zaKx09u70KUt162Zc2FCH/6nYocvG7YMhymfvPFuz
         w2d1/Qrkeivr/IWm+r7vjdDHIC6IbSsPVhEIDmodV4XsEFwOdfv67VObYDPABAjDpBHr
         l8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916374; x=1783521174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/PMJfwXDmjutwz2ZqUdHqOQ1qGXDhEDRkGoA21ZDRuY=;
        b=GhbbT95hOW/8nnV+MjYRWnlFomBufkDw4FerKVAad33ky1QOV1AqJNf69Q1PZv1JBC
         e8Y6KffskRfALLF3qGmx4N5D+Gmq9+/0scrQBVrNnSiwrg655u/FKf3EX+NKl4hQzYsM
         dxPT8RpqjolqoNnjZFrNfBMRgNreK2SWM8AUcX38nB6JxMiz/Q5uXNNoeGyq01JSTHnR
         DLX+/tCrL4UAODMLZpU1LSX70UDifBsyi4SmeesGM1IjmCLHpOam5AYO0roxHf9Ne1Fr
         jPe4lYOHLJiBmws4vhj+fxNsfWw9Bz6vyv9JfoEYW/WAJKyU86SMKe8F7afoWO5DOiOC
         w1mw==
X-Forwarded-Encrypted: i=1; AHgh+Rr7nGd4wNzh47FURH7k7hdXmlwFMkWHOe8shsYYyFJg0kvq5ZSMRmEkgPX98rvvZhXoJ77KMA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyTJ5eZFUGzAKPkH+dZ3HavJfRxt+S/uD9Dq8lggXc60qe6AIbW
	gpnvVUWMYVaCXGRCi18eJ3GMHyIR3aPb3kvF7tYhn0RZHdxLrpd8SxYn5OBjLrmkn1tXpi5JTBz
	qpEu3ZAx3EGMgOFg3XtGQzNg1dT2m1WA=
X-Gm-Gg: AfdE7cl6cTWltAUyLbvtj81u/1gQtYtLEooWDAaAQjCC9NC4KSc9LHBtjLTKFfDplC3
	qAaqROxZDMpESRTd5PUaApgt/IWEB1/8nAaF6CHJctBplLL0hHD7Wua0LMxSZ+9f/XgJE3Kp8L9
	fqvTZPCN16O51UaonQkG+GCeutFLRE+es+izE9ppDcaXEp1vIVlkrQ6eJvGl3kuMQ/ndsbqP2Nk
	FKrZNWTR8ZZmmRt//02m5U7GQUPUwuPNHpX0TJJvzVl/5FIGRfDAnOqQ6DReFt1U8T44y/kMWzV
	MD5Xnhf9ytyew+fsdovgxy+6NSKv3hVfmLRQQp27mj7RmOOr3lu2FxoDAEu/6Q==
X-Received: by 2002:a05:690e:bce:b0:660:a41d:d175 with SMTP id
 956f58d0204a3-66521b945c8mr1896345d50.55.1782916373989; Wed, 01 Jul 2026
 07:32:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
 <20260630-apple-mtp-keyboard-final-v1-8-506d936a1707@gmail.com> <05d39c4d-8405-4fe7-a798-c8a9c92699ed@cyberchaos.dev>
In-Reply-To: <05d39c4d-8405-4fe7-a798-c8a9c92699ed@cyberchaos.dev>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Thu, 2 Jul 2026 00:32:42 +1000
X-Gm-Features: AVVi8Cf357Gij5feihuaNZJkJ4WRqS0nufoZDV_3Bt4D6iI9pAVwxlHJbwtr7a8
Message-ID: <CANpmGNs3s2yLw05jkpZ9mscQNZ9JvfbqEgyW8V=cMD29aU8c2A@mail.gmail.com>
Subject: Re: [PATCH 08/10] HID: apple: Add DockChannel HID transport driver
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, iommu@lists.linux.dev, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yureka,

Thank you for the review and the feedback.

On Tue, Jun 30, 2026 at 11:21=E2=80=AFPM Yureka Lilian <yureka@cyberchaos.d=
ev> wrote:
[...]
> > +     strscpy(hid->uniq, dchid->serial, sizeof(hid->uniq));
> If the keyboard appeared before stm, dchip->serial might be uninitialized=
.
Yes, true, thank you for picking this up!
[...]
> > +     /*
> > +      * Prefer to enable STM first, since it provides device IDs. Some
> > +      * firmware versions do not expose STM, so let the keyboard start
> > +      * without it.
> > +      */
> > +     if (iface->dchid->id_ready || !strcmp(iface->name, "stm") ||
> > +         !strcmp(iface->name, "keyboard"))
>
> I specifically asked for a mechanism to let the keyboard probe even on
> devices which do not expose/have stm. Thanks for adding that!
> However, I think this might need some more sophisticated mechanism to
> decide whether the stm is still going to appear after the keyboard, or
> not at all. I'm not sure if there is a way to tell this at this point,
> or we need to add a timeout for the stm to appearing, which needs to
> expire before we create the other interfaces with fake serials.
>
I do not think there is a way to tell at this point, unfortunately.

I think the best way to resolve this would be to implement a delayed work
item that is scheduled during probe. If STM appears and initalises before
the timer (I'm not sure how long it should be right now, I will prototype a=
nd
experiment) we cancel the delayed work, get the real serial, and spin up
the keyboard. If the timeout expires without seeing the STM interface, we
assume the platform does not have one, mark id_ready as true, and
proceed to init the keyboard.

I will work on this and experiment to see if it's the best solution or
if there's
any others as well as to find the ideal timeout, and submit as part of v2.
[...]

Thanks again,
Michael
