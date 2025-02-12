Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6DE20E027
	for <asahi@lists.linux.dev>; Wed, 12 Feb 2025 15:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739374948; cv=none; b=MoQLANpwSEcDAZtY3R/h1cJcc3Jit9q922q44A91sTuda4AJ48rWOSIyc+e7Kl0DDGfebbnNPmisn4qeJkrLMzV9v0JliWEIVZyVYScylzc0D/DjmxIOHSYJ75JTMQLt5Em758XvUO4E+JO6UdpXnq04mhfQGkUgZq9zfo6Wl8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739374948; c=relaxed/simple;
	bh=CVqII1S4rZjar1numyYt6ePWthTCjPSKc/XcmKsEYpQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DiUb5HA36uWXLo5aG7t+c82ljSxdrAT3xS7DdT0Knd9UrA/Ll8QmsbO9HIFXE6BznRp8bl6dWNy5+ttXqGXW+eYElxrfu4FYuQTH/tGAYSPsc5TpZaF3RqOspBM9AwpUZgD+oQVYQCGX7GcO29wA2NR27aojn2fyoOIu4NVc4+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ab7b80326cdso666492166b.3
        for <asahi@lists.linux.dev>; Wed, 12 Feb 2025 07:42:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739374943; x=1739979743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9Gpp6exxOAKgR4+qfssuhnpHihI75y6MvQ08e29riQ=;
        b=KLAIs8oay61tE0XwOJwbStMDlLwY084hfN4PCIQ8GLn6wPDOvanRL7HBijWSJSxXjx
         9gwxGqYBZgHQvyjkPDWRrYG1Y/2XCnkbGps8j7tyMS7aNDr8uP3u419c2C76JY6rEb3U
         RJRQ9U4+UIkfKYScE/PeLMQk05vMYUjdLBWdOsDIJKZjfCQxxooTP4vv6Hjs95YWAvsP
         m1RlOydLLIy4RIQ9D+aTtetI2zH3BFQ236uxMQvc+eUVbTx41/sDeBbvRLQpac3ZH1cw
         hfOXKqJxLzAtqy6hHfj1gC7xSm6HPYG4dq8xD+c5M0biDtwQ0l60mxCY/vMxOQ66Do8B
         QC8A==
X-Forwarded-Encrypted: i=1; AJvYcCV9CBTvyZ/CUVmqExG54JUi1sPuX6MTOJqgoKMWfSwx0DvVOKhSOkwarqB1+OR3OEdqsmQwMw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywm3D5M4oPJqUGnZAIvKGYzarO/7OQKJ1AzcKL6XmiHB3PsdddF
	zq51lzza9s2XC+vuGSd/r1+yVyJg289/U/rwLcP7RMjAueS/71S1vRlG4ySh
X-Gm-Gg: ASbGncs2N7mOApRe7illET8jRYof+AnsuPI8M6Z2jItW5CzPOnJfN2mt4Cgdj8awfuA
	bFNL+Z//Uhf7+unmZ7wwO5n+fHFdwCV6UpFb7kXXyl46CBVNZ9LojCBFdiN04CyLO0uvmedR5yw
	Ugg+MoCyR7uDPZhxfSX3wWgLY09kS6HrRZEH6n8DGUHwEkcYiaqtjgGlpKmVHTMZJCLvqbNpCuv
	xI4T5lMa9j2y69uWvSQA2U+7yQtyaMpcU9yhk3vRHsSNgIikCTGBfMq5besu3AqgsUdLIyeD1uG
	t7z8bgqyhHimhU2d5hcbe3elVNy52wCsDjv/fN2swYif1w==
X-Google-Smtp-Source: AGHT+IE1CEhflEuQET/kG7kLA8qVOkFn2lDuYWnmhx3Bs0rrfZSR7bGMxSWlullTBEb2ux8jD25D6g==
X-Received: by 2002:a17:906:c112:b0:aa6:8d51:8fdb with SMTP id a640c23a62f3a-ab7f33a1595mr342998866b.19.1739374943057;
        Wed, 12 Feb 2025 07:42:23 -0800 (PST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7c6d40b94sm579430866b.6.2025.02.12.07.42.22
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 07:42:22 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ab7b80326cdso666487966b.3
        for <asahi@lists.linux.dev>; Wed, 12 Feb 2025 07:42:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXTQh+OQBIcXXsJAgOCoicaypYbmY+yo5UB0GwQAKun9ka2creTBuBOmHTNEKQOCjnCHCEiEQ==@lists.linux.dev
X-Received: by 2002:a17:907:d8f:b0:ab7:be81:8940 with SMTP id
 a640c23a62f3a-ab7f3365c62mr272181066b.10.1739374942419; Wed, 12 Feb 2025
 07:42:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250211-nvme-fixes-v1-0-6958b3aa49fe@rosenzweig.io>
In-Reply-To: <20250211-nvme-fixes-v1-0-6958b3aa49fe@rosenzweig.io>
From: Neal Gompa <neal@gompa.dev>
Date: Wed, 12 Feb 2025 10:41:45 -0500
X-Gmail-Original-Message-ID: <CAEg-Je9cagWShwMbSqdrW9iqV+kiwJMdJBfjUru6kjXvoZ9rmg@mail.gmail.com>
X-Gm-Features: AWEUYZmWQeHLZ0J8NFYXZ_GuzgNgnx9jWhxS5Mn1NK7iDLLdbRqxrj4qVt0xYjc
Message-ID: <CAEg-Je9cagWShwMbSqdrW9iqV+kiwJMdJBfjUru6kjXvoZ9rmg@mail.gmail.com>
Subject: Re: [PATCH 0/3] apple-nvme: bug and perf fixes
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 1:26=E2=80=AFPM Alyssa Rosenzweig <alyssa@rosenzwei=
g.io> wrote:
>
> This small series fixes three unrelated issues with the Apple NVMe
> driver.
>
> * fix NVMe on firmware/machine
> * fix a power domain leak
> * fix pathological driver performance with random writes
>
> The first two are strict bug fixes, the last is technically an
> optimization but given the measured 200x performance difference I do
> consider to be a fix ;-)
>
> Given the early stage of mainlining for these SoCs, none of this needs
> to be backported.
>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> ---
> Hector Martin (2):
>       apple-nvme: Support coprocessors left idle
>       apple-nvme: Release power domains when probe fails
>
> Jens Axboe (1):
>       apple-nvme: defer cache flushes by a specified amount
>
>  drivers/nvme/host/apple.c | 124 +++++++++++++++++++++++++++++++++++++++-=
------
>  1 file changed, 107 insertions(+), 17 deletions(-)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250211-nvme-fixes-29c409c2553f
>
> Best regards,
> --
> Alyssa Rosenzweig <alyssa@rosenzweig.io>
>
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
