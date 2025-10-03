Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABCF2248A8
	for <asahi@lists.linux.dev>; Fri,  3 Oct 2025 21:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759527873; cv=none; b=MmtG/8Hupd6jUDJ6K94TmWIMWlmFUhtfP6ba0BVnx6OcfBMeYDnEvPqKVtBh7ZuEJhiWpBHFraENisJ/g5oBPJFoO3n9N+qLPd+/1I0L0m+N05SsqXyAFqjtnKcA7Ln3RRAnzddeNIKt9LPzQvoyUSM+/bWOgswzi/AZ6aN0fnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759527873; c=relaxed/simple;
	bh=WgYLm3VZ0UmFV01TgPlUig2yCKJnOPmNhrFlqaAZ2uQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wa6tN27vpRSetpxQ2fcTTv0Wk4PF6s3e+pRtOySaTtglX5LDYUj67yhPUxo0kX0qr4f2rOjcfuo3rDjMC5Yv4sYXbxdeyzz5o9mkzJbBKeGCbtmSROADctmp0r9/RxcNV/M8KL7e/3GPfkPSBG3ASjR9zXgvltEVh/IvwI0Tmgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-43f7e0494ecso1530267b6e.3
        for <asahi@lists.linux.dev>; Fri, 03 Oct 2025 14:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759527871; x=1760132671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YROip0u2m51t7JzjiRptwt79A/Uhb6ID+VcZ6g1PHCo=;
        b=JB8S7p8XDtEABnuo44W6JgA3rDV2JQ0GLK8QFwDuccUyu36PHcd4z/ahUoj8LQ9S06
         KbrEn13wnDR4ggREb+/xzHO38tBCybHWpslLwZSbUyeJnHhxuG7TAIdeqinq1HhimBDx
         M43g9TE1BaKW89xf3w7/t7DTD/fGMbD/Os9R4Yz1SE6luZSpHhTdT9ksQCPVpRRzCWWl
         F+cyltOTeA/pl53w7TziVsPuuJwB4cT5fQxoHc2ZTJAVRl4Hv0g0DWAj9Xpy1rKJHBlx
         nYkoUo4UQsono9lwi3mx0kYAGOW8FXiYfi2dMyMIlMDQRJA7oLMv/x7ovKXXuUAxRMus
         EYPA==
X-Forwarded-Encrypted: i=1; AJvYcCVWONcwhfkggmgyBB7AbHV7pIbuvVP9qouD9sNq6+flcceYsmwxsmJp3jOl4Vs7Hr4qdwNcHg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywcia6KnTLb0g6Wf3SDgIqJ0T+yFz6B1cfsnj8sshVqN7UhpWAO
	p17feFy5ltT//QYxFuer7QCWVnkSkCIEdZXWbtymbksvUqc9a8DrNEXv3DLz8kR4
X-Gm-Gg: ASbGncvEnrLfzSagAGBx9PrmGqX159icTgMwctC42SLjzbePqINmAbzebVcvAI5MajA
	lGMdtdHlEdVVJYlCdc6vSX2Sx3AXaC+PnUXFnFaXOBWSIqA1j01XXsQ6uvnslHPibYXqFwqyN5V
	gUV716lkEdG7UP7Ma0/HPrYcXhcgK1FzDnRLvGAZlPQwNwJZRaL/mtfk7ja8TFk7eEBVfCPqMex
	EiKireOUlqYW3+eCeHA++TJOGHIUGTeImEDZ70McO1o6/I2bPeZcol9H3xW81+nlVOh2jqvcwoV
	vgB6b33tPG60t3+au3RlHfGyf1u1+RkX6zbqStgeaTf0gnnIZiGDMgItXAK1pS7ne4MdBrr+Vry
	htFyeCXJct7TJMNEonMh5IDiLtgPuZcYkMisF6bijO4ZxNzHtRO7Cl0BmCgnDJ/KMjk5IM+XGV7
	HYWvGqnxS7XML+3UX/26vA8YLsuWsarBWns7GxJWgcxHQ=
X-Google-Smtp-Source: AGHT+IG2YfZEazv5j4I/Yxrl4lDE99FRhrB0plXSjySbaD8o/2twJ2IgE/KyTw70XYp7NNdYnmOjeQ==
X-Received: by 2002:a05:6808:191f:b0:43b:9be2:2f45 with SMTP id 5614622812f47-43fc178f71fmr2650470b6e.22.1759527871041;
        Fri, 03 Oct 2025 14:44:31 -0700 (PDT)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com. [209.85.160.48])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-43fb2475032sm1346506b6e.11.2025.10.03.14.44.30
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 14:44:30 -0700 (PDT)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-364bd7cce53so2107795fac.3
        for <asahi@lists.linux.dev>; Fri, 03 Oct 2025 14:44:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVuphQ5Ey9gHSxmqDnZ3rqpghNk7n5x6K8n1fgKlPFcNju4/GVpXSUtil7SJ5cxSmN6SjJs2w==@lists.linux.dev
X-Received: by 2002:a05:6870:d327:b0:31d:8ceb:20f2 with SMTP id
 586e51a60fabf-3b0fa0501d4mr3024357fac.41.1759527870652; Fri, 03 Oct 2025
 14:44:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250926143132.6419-1-johan@kernel.org>
In-Reply-To: <20250926143132.6419-1-johan@kernel.org>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 3 Oct 2025 17:43:54 -0400
X-Gmail-Original-Message-ID: <CAEg-Je8T+UCMeLsT98SEB5L-KXa8UiXNkZ4x+YXK2d+0bmBv_w@mail.gmail.com>
X-Gm-Features: AS18NWBdsDw02jLLWNxaCp3ioe8zcoIOI8PUxPu5WG55XB6t2CA2MqNUivNjj5Q
Message-ID: <CAEg-Je8T+UCMeLsT98SEB5L-KXa8UiXNkZ4x+YXK2d+0bmBv_w@mail.gmail.com>
Subject: Re: [PATCH 0/2] soc: apple: fix device leak on mbox lookup
To: Johan Hovold <johan@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, asahi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 26, 2025 at 10:31=E2=80=AFAM Johan Hovold <johan@kernel.org> wr=
ote:
>
> This series fixes a device reference leak when looking up mboxes and
> simplifies the sart lookup by dropping the corresponding reference
> sooner.
>
> Johan
>
>
> Johan Hovold (2):
>   soc: apple: mailbox: fix device leak on lookup
>   soc: apple: sart: drop device reference after lookup
>
>  drivers/soc/apple/mailbox.c | 15 +++++++++++----
>  drivers/soc/apple/sart.c    | 13 ++-----------
>  2 files changed, 13 insertions(+), 15 deletions(-)
>
> --
> 2.49.1
>

These patches look reasonable to me.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
