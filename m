Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A963FE65A
	for <asahi@lists.linux.dev>; Thu, 12 Mar 2026 19:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343849; cv=none; b=GmaMyrAEkh0hegTOXNDVr2L8p/slCVJv9fxaoXngD0fFeR+k77UKBfuXMVUScKb9qsKm28AWJa5zkLqGUHY6hvzV6/Q5YorGunFoudZuY+hU8qMYUsI5U+2ZgMm2ZVx01LLcyXnls+M1JbyEmfMbF7zibO5GAvitYV4earBzaBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343849; c=relaxed/simple;
	bh=y7Ic8SkZEutrwZjF9wbUzch2Yj6Ry/4aJx/GuhaJsnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cn7TZ9I+9r9qp+nJCwrpl3mKw37/oYzHPeaTNHw9PuPTx4WW9dj4hSlPUzACVZttI/8ZEgJ+STRGNVRRLh61QPKgcnrtLRJNk+Mmulx1YC2RQ0hNs+R//JsTvEKNjChH57fJVw6Q/sB8qrEImI8YAKjTjQKCw3YLbXOvcbSy2fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7d76c145ed9so1485474a34.0
        for <asahi@lists.linux.dev>; Thu, 12 Mar 2026 12:30:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343847; x=1773948647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nwiFGJRSfB6hzdknB7fn9cdgGxf64BtP9o6kcYSkeQ8=;
        b=lGLRRMQiX8MqKMLtiEGB5l0bt4kWidjfLREbm4CAjhxAOXvIN7U5k4DDDnn2PtdAZu
         VUU63P4zWdooH5UGLRRC+BIqI8mmHxFZeFrtNFWjiAf6eCJReZS/szvnvx773ZePe+nX
         EkMwF5UGvjy+loTLCjzCBHGwRmKQ0MD0i/X5Ke/YaV+owSoT7RILZNKr5DDYkbg8Uwg4
         AS6EF3lqq8gBFw8PRPaligL6rje0PtFNNvAXqd0nJ92QTn+xwNI9Ud+cdiiETNJnHdcc
         AfNpvXZqB2gODxwQc0Ph1wIDJ2v4A/2hHF/AeKxf+Y/OrLiHF6s0zZdngx1CLNF+OKGc
         R3qQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9lcVeNy73qsmryUdsebgEmqUDKHql/RFCIdeZyCcXjqdoQeC4Bp1D4Ja4Wek0qMJySmQHlw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzYdaY3Tc5FBJWOxE+0d5dQcpNj6bz/PqG8HQMyEp9t89f8EegT
	+cmD9YLyIBp9KD2fd7o3WG8nnDSzAZOKfahKIcViKmHCudAJmMeZXV44pec2/g==
X-Gm-Gg: ATEYQzysoRgKgmBi2FPHeAFxAAcoGDEn7kPM3LoyfxxLYznBr1HZEqWfUFr0Mort0TF
	JNgsarBtozr4ObXUO5rerMEfy2p0Csf3y0TaUIYarpF6J4kG+HMQ5hq2zOEGEmq6MN/wxPzcNAo
	q7+mUwo1l7mMy/co5/NMG/TjG6ghtpPKyGYrluc/eVSrJHfYvIb/mwyywTFk+1e47w+GwH0+vSs
	9/1sbGj3wn0pSj1LEFHIgkJj0/I1rdrfLvfTr/Bs5AZhyJSB00IHx1C/+P74llahVRrJCZivWJS
	pC6P/9N7OjccF1zGqe/sO43tSC+IJy4diXiPIrCjP4InbUvR/7uh6uh80AN9UdXCNLo3hEI7gcZ
	CoAPzrAEhrtV80F0Hk+Yf3yV2KLUII2YuqzEo1pUT7pmNpY+nuujqaLYaDfsf3Ea1DaqhDPhgo/
	b/8CYrq1DbwBBjIUC60ftIWDNvxMMHuLSNMCCCSmfn/TUXObzpZPyjJbqn72cZooVv4fzRafjjz
	thEcUrmBDhADRzbCVvUOoCHfoRrbEmsEPmPqhod3KMMfK5VOYYH2qa3nIN1q7Lss04k1ylkdQ==
X-Received: by 2002:a05:6830:923:b0:7d7:4eeb:8d1d with SMTP id 46e09a7af769-7d7825b8fcdmr426237a34.26.1773343846788;
        Thu, 12 Mar 2026 12:30:46 -0700 (PDT)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com. [209.85.210.48])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d76ac8ce73sm5125014a34.11.2026.03.12.12.30.46
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 12:30:46 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d556c1a79eso1553572a34.3
        for <asahi@lists.linux.dev>; Thu, 12 Mar 2026 12:30:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZali1TqRu3leHYvXvoBvVy12TME+SryW2pwegXA+HDNXhbHhp+W5PlIgs9IiT7325pNnJ4w==@lists.linux.dev
X-Received: by 2002:a05:6830:6508:b0:7d7:44f2:cf6 with SMTP id
 46e09a7af769-7d782574aadmr414436a34.22.1773343846017; Thu, 12 Mar 2026
 12:30:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2838895.vuYhMxLoTh@fedora>
In-Reply-To: <2838895.vuYhMxLoTh@fedora>
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 12 Mar 2026 15:30:09 -0400
X-Gmail-Original-Message-ID: <CAEg-Je-KwNNGoi3mpPeNq3Jmtzj_5seuj1Qeh2_1dt994iCJSA@mail.gmail.com>
X-Gm-Features: AaiRm53c1qZCB280A2IGi5tKHEffuGeO3K6uS7gw8tLpnvn5EhoDD4Js_TJQtX8
Message-ID: <CAEg-Je-KwNNGoi3mpPeNq3Jmtzj_5seuj1Qeh2_1dt994iCJSA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: apple: fix spelling error
To: Axel Flordal <axel@flordal.net>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 7, 2026 at 5:29=E2=80=AFPM Axel Flordal <axel@flordal.net> wrot=
e:
>
> Change "configiguration" to "configuration".
>
> Signed-off-by: Axel Flordal <axel@flordal.net>
> ---
>  arch/arm64/boot/dts/apple/spi1-nvram.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/apple/spi1-nvram.dtsi b/arch/arm64/boot/=
dts/apple/spi1-nvram.dtsi
> index 9740fbf200f0..d2720b307774 100644
> --- a/arch/arm64/boot/dts/apple/spi1-nvram.dtsi
> +++ b/arch/arm64/boot/dts/apple/spi1-nvram.dtsi
> @@ -2,7 +2,7 @@
>  //
>  // Devicetree include for common spi-nor nvram flash.
>  //
> -// Apple uses a consistent configiguration for the nvram on all known M1=
* and
> +// Apple uses a consistent configuration for the nvram on all known M1* =
and
>  // M2* devices.
>  //
>  // Copyright The Asahi Linux Contributors
> --
> 2.53.0
>

D'oh! Thanks for the spelling fix!

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
