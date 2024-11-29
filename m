Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC9D15098B
	for <asahi@lists.linux.dev>; Fri, 29 Nov 2024 07:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732866852; cv=none; b=RPc9WUyoheZsai97fJo4Vwbm5hNOSlkuY+pTAF19PGc3ArcDj69jK3Y/Hgzuy9QSjmKSbkSFz9Bj7prj0phwKeOqsRgRNNQUALlANuZNDH2D5GsDdoCdfASV0a2PNzsv4vn298Wz7eSXhSaJd9oRKl+K7CmdH/rpp9edRsZIBJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732866852; c=relaxed/simple;
	bh=9spqvrZ+LoHD+ZOLFz4+YFT0uhD8v0cffSFDzPA0+pY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M9QZ336zC40s6tY8QLllvqNVesKtVeN4qXt4NTlKtnaXY5LYYb2dias6dP477mdBNUklNES/BQyExUSfQcUSYOskZVJuWraZumU5Jth3rigQFfgN/2RP6NadJkPiUYi4xkpVDP9uOyyrmyF5vMj4buCCJIhyZ/7gFaAZe3xQ6IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HgOuFT4g; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgOuFT4g"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6eeb2680092so16087557b3.1
        for <asahi@lists.linux.dev>; Thu, 28 Nov 2024 23:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732866849; x=1733471649; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MILLxUu9rzLsxKaeqYpm+2Gulr4Avp7+0QuruaQfahA=;
        b=HgOuFT4grguaBCtDk5VVQKnLTr/PsaHtWZSfrmJJ3VNtsJpo2q06OOV410FCb6ySTS
         t7rmgzelP8mvMmMDJ1UkM3V2Xxd/QNf++bFYhT9RlDtnLt6G8lIZMAtdeJ2kiLJwsle4
         31t8y1Q+9UZKYiMA9AndzMmx5uEAYtFjHETRSKbeyZ16kjRBZTJjlOfXhS/q/VEl5Iqt
         TzVjKG/9EcAvndnsDkq1DEmyENQZ3xVT8lePOBzirH2wHp0qkzezvRDpkpoj0PCWchCx
         p9mIXY6acgc0B/M4sNghQFbJTZGacIxNIFnynuZbJW1utRyCVwkT+7uuGUnsQ0IupksI
         39jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732866849; x=1733471649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MILLxUu9rzLsxKaeqYpm+2Gulr4Avp7+0QuruaQfahA=;
        b=SH9SzjmD8TbY2PP56/eMyssPOrz9LSVhLZEhcyagtJmvh3xlcC2BTnfIcVpxwazepU
         xjcXC6Yj9HnQXOc9HD8f1ehKJApXfyvV9S2ExmlNAybu+/tTcOPrEeoS/4L4b+Cfag0Y
         klT4YEoY3QXFeKXIpvMkKsz2uovYyo9zwjCS+zv0veC+fy2g8I6rSkFXlPRddFcSaEvk
         LxZoj2H6pbtc47b4rjuoJV+Uuu+pFQax+90OMsuJbWk/rXNSQjLnRXVc7bMuLCzQMMz5
         m3ABkXfMzER12d8Vb1LTRmlJCGGPgFGgEo2AMuzOeNR4/rhUw4bDsMZpSjDcRakvcznh
         O1Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWjXPI8UpGXsIn2UK4iHNF7/ay3pkwTHielwoUJkh7d3Sn3uPenzUNoTNSDC4BkWNnlDKR+Qw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwX05g+hvPtA+18oA+xRvrGJQeIcADiUppZJt3tS+jo09V+96Qt
	Ws3LD9TzoJvxzYmuDxJuCnHnlxYePDD8tphB3y526C0fQwz2xAS8jX7ts+g6MnVBbgxyQd3yZIB
	NOyOZgEVTkQWCY+C5hqyIXNFM0Q8=
X-Gm-Gg: ASbGncvVl9ZxdNDgKQk75H6Dxg6jMWgn5j6CnWEJf/xBiFMuE4VUVqrqBucMrB1178Y
	2EvrINQaCPdDnt95vVF4B/uTdUhN3kLLZ
X-Google-Smtp-Source: AGHT+IF8HFusBVWylrBABsLEcXExgX39TFtK9CKcRntzgb2j/Eixg3DOFVeP3pBNmvcd13VUQ6ALY6h5mUnCdbvtq3I=
X-Received: by 2002:a05:6902:114c:b0:e39:772b:4bc0 with SMTP id
 3f1490d57ef6-e39772b4fc5mr5024271276.42.1732866849543; Thu, 28 Nov 2024
 23:54:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241128-z2-v2-0-76cc59bbf117@gmail.com> <20241128-z2-v2-1-76cc59bbf117@gmail.com>
 <abmpkfnfrbcarqhp7pspxmy4veuiavpy2p5zqe5ljkstveuuzz@ur7grz3zd7xx>
In-Reply-To: <abmpkfnfrbcarqhp7pspxmy4veuiavpy2p5zqe5ljkstveuuzz@ur7grz3zd7xx>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Fri, 29 Nov 2024 08:53:58 +0100
Message-ID: <CAMT+MTTRT+z2i6qrqVo-KVNuPF2o2OV5HpfhbXiAaWU0TBr-WA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: input: touchscreen: Add Z2 controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 Nov 2024 at 08:16, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > +    description:
> > +      Calibration blob supplied by the bootloader
>
> What is the expected size? Fixed size or maximum?

Unspecified, 1688 bytes on my machine, but the firmware
has a size field. Most likely less than 4k.

> Add it to the example.

That seems counterproductive - it is a ~1.5kb blob,
and it is supposed to be set by the bootloader, not
by person writing the dts.
