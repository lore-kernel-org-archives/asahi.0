Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B9A288532;
	Tue,  3 Jun 2025 18:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748974608; cv=none; b=owlYiOt7o/IuofGCYyXYFGsxITNVq1tBRYLISlShD/bbf4chN+dcvu1SZtxrAR5EGFQDj/8r9OuNLXvuN5pjzP5ME7tD1MEqAz8dHwqZQI8ZXLygUW7ADRLkZlaxRjOL7KcwI0cOySaLwqLrQ7bpXHFSzz94k26cK6LJISOqzF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748974608; c=relaxed/simple;
	bh=p1oikR6A7CSugoR4HjSUuEWBgK7rKrZS/huPT73PKfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M+ws9QJ/5A6SldDYUUs//LnnT8L1nsNitNDAhU1arqQb7lqqB/iMs/9HV5GkuRF3uFc6OvYxTQjDI2p7ZDKklbFrErG41i+4oJVG4muncq9YXo2nm2d5lchTwxiswJhh6+dwn6ym27MvekCyr5b6856zWl12tq3f2bZiv9tGeW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=eNBaPN+F; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="eNBaPN+F"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2345c60507bso38014965ad.0;
        Tue, 03 Jun 2025 11:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1748974606; x=1749579406; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muedraecWG3k6sC4BkfWIIfP1Qhn6jm5riTVBMIqDbo=;
        b=eNBaPN+FTrWxIzsLzKQGBAmVdZ2aBeHKdCB3s46tRnrJD3OW40QGhEuQ7hrH8uzinu
         ldgpTeIF89jkNi9eLstReVkw+2NBaXY93VtTcvuU5dyTY09yXSxpxBKRclqYi73koitY
         IXxU6g9xUJD4pyjCyAoYegouZLwYnThFBT/lxNx9cDgf0VxgSncUY8ptXh6yvN1K4m6a
         XKcIccB1AVH9WEc8zJbnyqws91MsvfF0SWewFJGk/YC/QbxjQyhe/oBt3iFyRRIhUvwY
         8sEJvWNQLRRafgwcC2MGh4mhu7Q2mUpB7NvTvL8z6WoMdXA7en1Bba7D514cgFQezG0D
         Z+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748974606; x=1749579406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muedraecWG3k6sC4BkfWIIfP1Qhn6jm5riTVBMIqDbo=;
        b=msGd6pYb/if9waDgUeUhhY1LYrQ2T6QlmRlI85Ulcr2HP5qbI3HoGzNos4ytTpK1h3
         tjOBOdfnGhSAfAa3OcvwmX+8MatQTKdOgowN2GxIgwT4bTVwFYZCJ32mpgS95QoRJr7p
         2Ekc2puNuE/rUOnhCmqHPjvcUycMGBxHv0WtMwGLYpDu+mRhTwGLgyRJZIYHz/30vs10
         Kh7Wo/W5qB1U62kOPxoHIAR2suhTD80o13/I0HVMCVcvN1diJDNoF84tJ5+ja5X1r/0+
         CiZyNCaWHex/5obOiO7E4XVk8kB04ItMVnx7JrHXzAfAmNN9zLKQ370Nj6sT2lb04p0m
         287g==
X-Forwarded-Encrypted: i=1; AJvYcCULlIwTSWIBsoG/Vv5CSchZqpIDq8H+nIgTjSSG0R37lYyAeLWQr5NlY3D4/JTTZYrd0LC5Tg==@lists.linux.dev, AJvYcCVEwvL1ZbvSY+c+bZV1qB/QxyBA7PpEhc9iwojvq/Fm0wq4NuUsVNOcEMEUP9qZTIbFuhVv678eRODhL1M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yws1+Nwba/7KDvjuVcbbGNb/qhW6hgMicR88YvQh6/Bm1zNOhUu
	qir3dlHN85MTSvDMLMBaCqdNmhBTKDoZhYKwtFwwaM7z95tr4F/3/DTf3xkXEY5WTPD6rUVyrf8
	HrUvWtoYfAzyoltnefRloAkyfBUB3ENI=
X-Gm-Gg: ASbGncurlvxqY0EVsfXqK9SZna7D4H7Efk/Xv4j6B7KFhTYpiPsJzF5/Z1OnpCPCLYg
	7BPtjE/diePPDGN3xhQsGDASm2aAkm8XMhGfLfRjwJyiPMomRXP82gVnXRguJIupRGgAkXhXJYe
	XhW/g3rgObw7+EEo8wvPPZeQLAOi9J5tpE3a38iovw42k/7vZxWfmbNqIwXpzDPfaH41iJoQtHn
	rgS
X-Google-Smtp-Source: AGHT+IHr9J8+h+AZ8STPC1y2/qEM2ZZcXzahpAeXjwcKczY154NqfHQ6m3ty2wKy8w/H9uZv/VxmB7VQvs3K1RzoMLk=
X-Received: by 2002:a17:903:234c:b0:235:779:edfd with SMTP id
 d9443c01a7336-2355f76c215mr179533115ad.39.1748974606365; Tue, 03 Jun 2025
 11:16:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
 <20250603-dt-bindings-mailbox-cleanup-v1-1-724407563997@linaro.org>
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-1-724407563997@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 3 Jun 2025 20:16:35 +0200
X-Gm-Features: AX0GCFsq34ioWPbcIqxTayHSRdJ5z4uSRbOfAewoz0GwtzdI-PxfH0Fpo31M6tA
Message-ID: <CAFBinCBSyniWtR5T3XdgohG+n0Ae=6tgmdASSxsnsmoQV4yhQQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: mailbox: amlogic,meson-gxbb-mhu: Add
 missing interrupts maxItems
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Nishanth Menon <nm@ti.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 1:57=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Lists should have fixed constraint, so add missing maxItems to the
> "interrupts" property.  Since minItems=3DmaxItems, the minItems is implie=
d
> by dtschema so can be dropped.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
