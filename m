Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528FBA48
	for <asahi@lists.linux.dev>; Tue, 15 Apr 2025 07:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744703234; cv=none; b=X1WsIcRaMvnhTIHlYn2qgj0JPL1YpE06uAr8C+aGWvTNN5+hyEI/Ir0fvxWFnktPs+iSyHfP5Yuq9mjsWcvbbewXLanY8A/ijhK57JH7TJq/uloGGlNU5+p0+2sLFKp3eoh6fHCn/Fiu+uqUErZIn+gwFfLp6eHOIbmbyK47bVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744703234; c=relaxed/simple;
	bh=4yPoe62szhk9VR7VjlQTwciHhDwhOMyk2ugho1Qd7ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W7zhTZAqkXueKijoLMJecu4u0X8n5SdMQcznfydHyNe7Fhda2LqQ9uQgxem2ISlLONCSTsbZU1IJhNZEGLWtonZB97xgVtf8vhm+5wr0zlMPolPKPDuFbUMq/yVzZeGr2Wuh8NZ5ITryyyNiAS1ZTDY/beJC8im9Iz4Sd0u7fz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rA+WXYYb; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rA+WXYYb"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30dd5a93b49so45406291fa.0
        for <asahi@lists.linux.dev>; Tue, 15 Apr 2025 00:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744703230; x=1745308030; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yPoe62szhk9VR7VjlQTwciHhDwhOMyk2ugho1Qd7ys=;
        b=rA+WXYYbPWr3qRs4fvGE6POqn4Y0TjnL+OD+1X9wW4LwzNkI0IPvOp4SPaUMYfaaOF
         hWZ6w8Zkje0upfiksFGAmRiDPPhCyUkpWKShtvdzICFT7F9FQwj3Xu7rbNw2az5HcQO9
         btmTQatOeMg7Hng7ilikOOdsm4+w81rb8JGJBytP/p25ljlK/U8D+wF+Zu2A6t9uPxoE
         PI2Bu7W9lQVkjdzzIbzj9p97h0lcox3wUyu3eaBBrSq4bCSqsbbX7v/BvMhJ6hxml3TH
         y6YT5axFKUQm8pNUvRZFe1n49hO9shNIO761CdbuSMn7xkii414rxewaOWM5W4levpSx
         ssZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744703230; x=1745308030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4yPoe62szhk9VR7VjlQTwciHhDwhOMyk2ugho1Qd7ys=;
        b=D1vK0c+aWtuDYVawZmvovCLqm2gVcFdikBm8J5uTUaH8iU779AOJ7TraogaqL9+923
         1MCP4plEn0BS48sApGgLQUN++N6dbUXGpBDUXOcrAHqMu1yulLSsFA2aS4KzGytGMrw/
         MyviO2NO9wefyPAj06eQCOJVnAS6VqI40r7OFCXERNPs7n+lElOtWy6OVmzhhJTyk/uH
         5Noke7rryQ/tAsDlyqo9mQY4c8Ls+jf+HM8lTWlghS84lZikA3juY3XDuVeOkgJlDUAY
         XcVm2EKU/kFWFFW0dHiD4PogLh2cEX2UQl6pa2rAC/qJ+fdBCqRWh/68ELkdJsHJQPUl
         Qcpg==
X-Forwarded-Encrypted: i=1; AJvYcCWS/WgsId+i095rsdYEOcf9kk1lGWDwMWrfM1MrU4BP/422avmbfSayPY6IDmagwbJpakkZbg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxt3IGpnZsAXCFdL7VKuU01P43Xb8U6ncSqcN0dtu1aISReXgPv
	Cag9ZT6gxYg9FQk3E6/MuoVJczFC8/8TVPZaC6uorh4FthJASGStEIl/H3QKLvFclBVW5aHmCrd
	BGGZ0RKf7xurZ0nPk/tv+wTpMRw8G/S9EBQs30kupPPpsN+sf
X-Gm-Gg: ASbGncsXjOufCmE/0Q+NlQLjLuS42fFF+4UuC+NWUomBq30Zzok2njAtUejwuUgpnxe
	/XauHuXlBdMATIlDWfF71L5HvxlCUd4Z5vsWKhQH4tnBo3bp12j0jq92erVQHet4sjjWuH2H17g
	1r3U/jVyc4bfe1SIXtpGzvKcym1gSEVqFq
X-Google-Smtp-Source: AGHT+IFXq663dVyU8zMw2WCvomgufBQU39frF7BHP8IkhexHxE7q25QYQkfpa6jUI5F57/EgxHrlEfhdYTnxjnPcuUA=
X-Received: by 2002:a2e:b8c1:0:b0:30b:ec4d:e5df with SMTP id
 38308e7fff4ca-31049a80d31mr55920011fa.34.1744703230263; Tue, 15 Apr 2025
 00:47:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250329181506.890043-1-john.madieu@labcsmart.com>
In-Reply-To: <20250329181506.890043-1-john.madieu@labcsmart.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:46:58 +0200
X-Gm-Features: ATxdqUFkCKTY5402WfMD7L4Dn66nYTF8rexDIKyTSCReHIobCScCzKD7ElX6-PM
Message-ID: <CACRpkdY30jnwByCpsAR0Hvmq-WWMRcX5-2PtVtOy-_TD4GrHGw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: apple: Make regmap_config static const and fix indentation
To: John Madieu <john.madieu@labcsmart.com>
Cc: sven@svenpeter.dev, j@jannau.net, alyssa@rosenzweig.io, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 29, 2025 at 7:15=E2=80=AFPM John Madieu <john.madieu@labcsmart.=
com> wrote:

> Mark the regmap_config as static const since it is only used in this file
> and never modified, allowing the compiler to optimize it and enforce
> const-correctness.
>
> Also fix minor indentation inconsistencies in function parameter alignmen=
t
> to conform with kernel coding style.
>
> Signed-off-by: John Madieu <john.madieu@labcsmart.com>

Patch applied!

Yours,
Linus Walleij
