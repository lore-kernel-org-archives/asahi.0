Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0F01946C4
	for <asahi@lists.linux.dev>; Mon, 23 Sep 2024 09:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727082535; cv=none; b=jyV5/BT51Gay+s/iig1YpT2SicCCcnTDoUcA0EbmG1rW+2v0iopnCCU+coYRtWOT/s+nrAc4QfPx94CQGx2+/Zc6TGnO4kguohCDmyylHcY2VcGutwr6s2JU5oAd3BFYwUGRTz/vWb7FgR4sSSQk8q+o2A4OrZg2RHcZs4QmC0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727082535; c=relaxed/simple;
	bh=JELDF/Zw79oZ0FUIS2rLWoMNSuxFhGD3+cD8JeDI/eg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XiZaKcSfIT8/MBVB21xohG6Izy5DLjBCjjoLrg89hd6HBrkbXukpRVIRmGNOZ8QwsuXAy6Yj/td5swQ2J13vdCQ+v6SVsnZx952a2Ih8ysFhBzzDrQgC2KcK2/uwFVzWBCFkeGj1nMblYnihwuFUK2zIjSR0ZvakeIHdEp7rsLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F+wVtlaO; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F+wVtlaO"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5356ab89665so4774278e87.1
        for <asahi@lists.linux.dev>; Mon, 23 Sep 2024 02:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727082531; x=1727687331; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JELDF/Zw79oZ0FUIS2rLWoMNSuxFhGD3+cD8JeDI/eg=;
        b=F+wVtlaOcvCj4GwTBp8wwIr2aq7w7ia7KgjHnBH/XGg1B+zFTy1sk/6m6fqyrxejos
         1biGshCyIveeH/7tDZAn1u9TCRXksYRx+KssbwGNInHKr2bcQsjC3uEsCJ3Vxz82foiF
         xLjV+F0rszGCOu6QkewU2IHQUzWM2/jg99bSapQdLmC4e1yDYUmE2jhCXq+CWRgzd93B
         hYml9J6A4nCKn8Dz3WcADXhQu14Q2ywgTUPKjKAa4V+Nq3HmWkjjaCDwudXYgBRk4z+L
         jXz/8icP/h2Z3Ts84uINX32WgcycDYA8SqgvAJtODZFb61I2Y5gAJXlx7JLocbrQWxuk
         cUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727082531; x=1727687331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JELDF/Zw79oZ0FUIS2rLWoMNSuxFhGD3+cD8JeDI/eg=;
        b=pOQUhXmzFxoer6PO/GgJ0Zlbg/sAvg06KpLcpDbvi1E/pOefjTctTXrK0jmiK4u6pP
         aa+n/QlAJfmG8CXm7hMzUvoi0Nk8Q244Fx6qTl+pHJMavDsDyNVz7/84DAMRbg32zMmk
         pkRvoo1g+TncdcMoD8+Kh4sF7YMiyc738x9bgrK58PoSpfphl13zJolCSaoXn2KK81XE
         8otHWChz6Jsn6Ntzmarqvguy59gYFPjdcePspBHb3n6ufxvyBSNdrIZvu7oxZ/CqGzWa
         aYr2pHE0xq3tw1OO9TG2gh1SPDi2lyGW6JI+m+BsrTV6+9cqBXVQvRZuV5f4ip6lTF3t
         3t/A==
X-Forwarded-Encrypted: i=1; AJvYcCU6rLfs0Ey/YeONVvoTdmb9vwLxy7WcSLuLBB0S4IG44SYLseiYUOap/Uv3t3Jw+4gogD70iQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyd2EL8ou+5fzXJZE3bOdd4sH8vudF+DPJqjDquI7BBkDAorFc8
	64FZumEOLIBPFPD8YJxRyALjQuMjb9fKP57Mr5Ul89LrBeGM/TBE1uZXjlKVtCiQWu5YlVttxdr
	ca8uMZspUMUC2OtJAbF+eKGRYprgBi0ag3gsVhA==
X-Google-Smtp-Source: AGHT+IHo5OqAsBLecq0W7uEgoSonYeSP+z4Hl3h5JMui3ZaIwaomJwFKc1/L2fAHd4MtYPhb8fguCO69PRbjQ+Nc6rM=
X-Received: by 2002:a05:6512:3a84:b0:536:550e:7804 with SMTP id
 2adb3069b0e04-536ad161b01mr4635287e87.18.1727082531360; Mon, 23 Sep 2024
 02:08:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240905020917.356534-1-make24@iscas.ac.cn>
In-Reply-To: <20240905020917.356534-1-make24@iscas.ac.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 23 Sep 2024 11:08:40 +0200
Message-ID: <CACRpkdZYnwbpqSLrxaOZ-0rbbQq7XHjznnCqOx1Pk=8kPiYL9w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: check devm_kasprintf() returned value
To: Ma Ke <make24@iscas.ac.cn>
Cc: marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io, maz@kernel.org, 
	joey.gouly@arm.com, stan@corellium.com, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 4:09=E2=80=AFAM Ma Ke <make24@iscas.ac.cn> wrote:

> devm_kasprintf() can return a NULL pointer on failure but this returned
> value is not checked. Fix this lack and check the returned value.
>
> Found by code review.
>
> Cc: stable@vger.kernel.org
> Fixes: a0f160ffcb83 ("pinctrl: add pinctrl/GPIO driver for Apple SoCs")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>

Good catch!

Patch applied for fixes.

Yours,
Linus Walleij
