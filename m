Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A20717A31C
	for <asahi@lists.linux.dev>; Wed, 23 Apr 2025 16:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745425474; cv=none; b=E2GuYM4mEDyJtYa6UkZ/KLJxLElimTlqxLf9nGpVeJc7WXXArX1Xfuf01D5oinK51uHJJ2PgwjgOxD62RmVr8Lx40RvhNnyA91spFsYGx8inJxYHZFWG6sA8AyzmG+JRu1mBCD2/Zt4DS5iw/gSS2lnbNju19XhElR+baiQEhNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745425474; c=relaxed/simple;
	bh=G++E0BbS8a2hLlYRQNjKfQSgLliGyf9HwygxEobBzkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N8X/X0ByW7zRl4cs0eIe5Ez+/yTRQQsH9KDhF58E5waJYG9nCn4J+8lyKyuCCJ0cfaL9HVi+fD1FrVM0afSfYUZQ3p38XqoKZFL5cbm1lI+eDU7V9UaWaaEhmhDRNs4u9TL7v0ujGfrdcmbN2gODKF3A8pVEx4c0I2C110okPE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gr69dseR; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gr69dseR"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e726895a6cdso5598550276.3
        for <asahi@lists.linux.dev>; Wed, 23 Apr 2025 09:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745425472; x=1746030272; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G++E0BbS8a2hLlYRQNjKfQSgLliGyf9HwygxEobBzkw=;
        b=Gr69dseR1wlTPTzmXl4QS5UeAqc/33OfI8+ssakt2XU1kczRdgg2BAaV5D3NXl+Zi3
         KFvfRk1XWnogImhCgUzBVNNOk9u3HZpGtqdiXZnTWGLXD3KNfmmGHdjlSOYscPr/ki1n
         N+uXZQ1UPqFGV3tGhg9Auqp5JBbA4NHBfMiwmQNRFiIZ8v/a1iXz3R1EBl6iUt8ikeIR
         wFKbsUlGdWLR+O3sCpsp8qwUfqZmv/+J4xI8dFpMRYvsuZGFfTQkkYzsvz7PNcP62X+4
         yi8O7prdrHlYPDuh7Z4O7iUZ/kJetaSy0jsstW2CKaSWFwKYxqdDxa7tNlrsbfCPpj1k
         phEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745425472; x=1746030272;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G++E0BbS8a2hLlYRQNjKfQSgLliGyf9HwygxEobBzkw=;
        b=VH9eri53psFz0VVD8MF1u+SI2tmHu1zLjTHbR801baNKDuRiRWrz0jeEQOHoBKfbJX
         bySo++D1XJ0/FzGasBQchiUGQjQlgmPrxrk7LUEY34xAHbNryLS5pzqgfVLWVM5i8ELs
         vl3+VAqteyutP/PnZTTwDJgS5nRjqFJ9pVEFmHyctEDBixk4QBJSyrj6Akc63cGQJMlO
         wvFgO5UtO0C7bMvG5kUECIplop19N53skjMNMKDuWI4/73HHIxxjulXrjhKLXIZpmcoa
         9dUQCpQQOxW90cMh2GvzHgLC3xBSVwn4/SJ9QxJxSdoU83wajqZf4UZ+uITmfmENjdb7
         OinQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUjWwqeDaSAiJium+WnTi9UD2LnQr5rP+QgppG8OCcwueTfPFEUC9noTTjmBFZAKWyurlgtQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwS9wKBs9Yw4V/CHLXJBBhjk2CZfnVy7BZmlqyLd+9ZYDFtMOY3
	XvYnPjZf/hGAIScimVFe8iHxBxkB8nFLZ7wx90A1ylfk6ufe8+YcB7Kr68D9lUdrvY6gGoYqH11
	GkIOucoKTKvSmMB13mAr7Vq4iUnc=
X-Gm-Gg: ASbGncuAZq3AJU8A5Nq71ZuuLSU9nv25ep5toidn6EpWM85p5BVMsoytB8RlgZDZSun
	JjdkjufN6o3mO8Qartp4liohbamDd36duEi3/4tOnwcXSMfEyQzGOCj6ZwX0nTdjYgqICq869I8
	t/E6tAJiEuaaD4k/w9aroqovjVt1G7UQLKlg==
X-Google-Smtp-Source: AGHT+IHs7VB0iY6Hw7N5rvnV+mLaMrJKNgLLnkV8ud2KiERF243U4X7v8mCrDhf5Lox17WfhwqI4Z2HUJBZfiX1i/DE=
X-Received: by 2002:a05:690c:370a:b0:702:72e5:793f with SMTP id
 00721157ae682-7083c566db4mr2968467b3.23.1745425471982; Wed, 23 Apr 2025
 09:24:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250417-spmi-nvmem-v2-0-b88851e34afb@gmail.com>
 <20250417-spmi-nvmem-v2-1-b88851e34afb@gmail.com> <20250422133619.GA1095169-robh@kernel.org>
 <CAMT+MTTwY=z1-_94ws+Oi+wvE2PA_s57dPmpMABC26q=MPw1Mg@mail.gmail.com>
 <e4159c2b-4081-4a4b-9a53-d6d559a3196c@gmail.com> <CAL_JsqKwASbUtpO=wU-16v=y8S_wLyBxnFUmQqsE8GkzCz0hDg@mail.gmail.com>
 <aAkLY3TYIPG7ojwx@blossom>
In-Reply-To: <aAkLY3TYIPG7ojwx@blossom>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 23 Apr 2025 18:24:21 +0200
X-Gm-Features: ATxdqUG6yRu6Z589SiaPf7hPYu4E07bIBQRBOixmyYz2zFeCy4cnqCijifN7bws
Message-ID: <CAMT+MTREnfB2MH=i84ZPa0LvgdYz6a+aRs+Nb07Ck10y3wstmA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: spmi: Add generic SPMI NVMEM
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Rob Herring <robh@kernel.org>, Nick Chan <towinchenmi@gmail.com>, 
	Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Apr 2025 at 17:46, Alyssa Rosenzweig <alyssa@rosenzweig.io> wrote:
> It sounds like the path of least resistance here is then:
>
> 1. rename the bindings to be apple m1+ (at least for now)
> 2. keep the driver as-is (no mfd, etc - at least for now)
> 3. land just that (at least for now)
>
> Evolving the driver to share with not-Apple, or evolving the
> bindings+driver to share with pre-M1, can happen in future series
> if/when somebody wants to do that work.

That is precisely my plan for v3, which I intend to send soon-ish.
