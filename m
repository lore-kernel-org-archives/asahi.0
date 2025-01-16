Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93D41DE8AC
	for <asahi@lists.linux.dev>; Thu, 16 Jan 2025 18:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737052933; cv=none; b=Bsi9dp+XQNa/d4wRNG5yuvVk6ta+1+zNjUO8+u54o6Eo3MpBD/8FAzh6y9TB8NdiFi9mOz4ySpuK5xVgdQ7P3Gg/ivE7c3Y0SOYjZNjSkonNaC6lzsdlPFQSNjXr4UDQISqDcjsi7kPsmfq4V0iAn+XHgDuEzRVFqYxzmCdQBD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737052933; c=relaxed/simple;
	bh=zSL5wHMZ4BwaynjanjQAP5VVZMX0vbqau8aMtqlVRNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HfiIv+l3wG65mdGmxzA8FwSj+IWkk4Jd7oUgaIxQ0Aoey4Fo1vYYTpqto7aVKAOqvYRmAcPqViySxIF7S6ivTxhYf/5cWg/OLGUgd/oEn3ZUI06sxEGDb2pvI7S4e+oVbe9+upUBqRW5KXALHq4AXFTeOqPrdo0NT8kXNXm2Bjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hp0puJyf; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hp0puJyf"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e549a71dd3dso2452651276.0
        for <asahi@lists.linux.dev>; Thu, 16 Jan 2025 10:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737052931; x=1737657731; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NML6rTX9L72qLlb7AfCBgnyR2cbBUx3c6akQrbExKxg=;
        b=Hp0puJyfvR51ZEM4UjYaSuZ680hO4iK8mm1AtQpnsddowMMxCJfecgKU0GjFk6GzQW
         H//4vk7QWV5cesm0W+hOgr6Cgj0nBxalGK+DxLCoXCdUU6G27IW8HJPBjHA0HXje51yL
         9OwaqoztdEgadnf01m0M4SjDmOK+5Um5Ee97IbRHfo5w8E/B3bpVPhZ+E4k3KruKCl6P
         qmj/N42Z867in0ZWfOxiSgdmjrDCx/Mbj/fdrtev051kAU2rU4P1QlQ/D/qC5/U/Zar3
         oAbgnaOluBAuK4la27DE7dL7ZybPAj9Mr1H1duZzVSOYhpIna1FDL2EJuM5bN9SpfbTA
         rdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737052931; x=1737657731;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NML6rTX9L72qLlb7AfCBgnyR2cbBUx3c6akQrbExKxg=;
        b=DHGjfXfIJmJ/5STNdwOy4PAB3KU+Un3qxQtdUp8njW5m4pXumcx84cGrT1ADkq8glp
         5/Y4DAE2NEE7qPj3rndJoOvK/H7/T5TUKaQ23QAxkRhOe1MdYRnIK2G6GKGPm5RrY4Ja
         jHHhbszm1yMTJOdPYiFmnwHkIjYjDT/1IzOrjFq5mfSBG4wGRa+tohBM9dRByQwjEpsB
         OO+aDWVokcbjNg+RqWxdhGdY6lVUskkzlLamLgyXuVIx9YW5zm2H6n9pYBJVptu5PKXJ
         4YB5tIby1hpxgAp3C8dzxyj/xqOLna29Njdu4pFNsBBfP8Sv8GVWElNgNpUSOxQRJDR2
         cRfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZtQNoqmCPxN8R5Q80ev19Qtut5CKEelP47iyuuHMXyAvbC9tDkcdEsCp2C0zL9XKwYbHUkg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxaV4bx27MYTC2qvjvXDPjj8uqvB/DcVWScojc2jNjrhsxAeVQE
	S5LwBO3RXl5ml2dWEIf/iItWMDMUXrL/JlGv0xnr6PNPyZejslCmO1s7S53jJxxXa+rJDqVqheF
	bR2YKBj6mDuCI/fIfBdIbVO9iOPE=
X-Gm-Gg: ASbGncu0CpuxxufKh0hiaCSkaXS1X/elIEBKuV/KWGlE/wc3w12XuaSztog+64g90rM
	8GNe2IndgFFfmz6zqCj44qdTJU/G0gOpwpDQPD40=
X-Google-Smtp-Source: AGHT+IGgrjI/s6xaOVBHbScyM7IE9Im1N4NOLXcypovdtK+sa6A2HqO5UQpSC92AIJbeGu6/Yntga1lOW0CS39rvr40=
X-Received: by 2002:a05:6902:1448:b0:e57:633b:6781 with SMTP id
 3f1490d57ef6-e57633b6cf8mr12550590276.44.1737052930723; Thu, 16 Jan 2025
 10:42:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250115-z2-v4-0-d7361ab16ba0@gmail.com> <20250115-z2-v4-2-d7361ab16ba0@gmail.com>
 <3991ab78-d1a2-4cae-bea5-fb4dfa58aba3@wanadoo.fr> <fbfea2a1-71e7-4572-ada2-0d4315c97e91@wanadoo.fr>
In-Reply-To: <fbfea2a1-71e7-4572-ada2-0d4315c97e91@wanadoo.fr>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Thu, 16 Jan 2025 19:41:58 +0100
X-Gm-Features: AbW1kvbV-JZv8ggAR3kH02R-upbl0ZACxuPcSn7inUrp8BPKXzOfVMY_gM5ZC54
Message-ID: <CAMT+MTSTtwsoWMPuF9cHt1oHE8geWYZr4t7EU44wq5m3zbSyew@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] input: apple_z2: Add a driver for Apple Z2 touchscreens
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: devnull+fnkl.kernel.gmail.com@kernel.org, alyssa@rosenzweig.io, 
	asahi@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	dmitry.torokhov@gmail.com, j@jannau.net, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, marcan@marcan.st, neal@gompa.dev, 
	robh@kernel.org, rydberg@bitmath.org, sven@svenpeter.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Jan 2025 at 19:29, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> >> +    z2->tx_buf = devm_kzalloc(dev, sizeof(struct
> >> apple_z2_read_interrupt_cmd), GFP_KERNEL);
> >> +    z2->rx_buf = devm_kzalloc(dev, 4096, GFP_KERNEL);
> >
> > This will allocate 8192 bytes because of the way the allocator works.
> > It needs around 40 bytes for the devm stuff + 4096 requested. So
> > rounding rules will allocate 8192 bytes.
> >
> > So either you could allocate "for free" much more space, or you could
> > allocate (and document...)
> >      z2->rx_buf = devm_kzalloc(dev, 4096 - sizeof(struct devres),
> > GFP_KERNEL);
> >
> > or have an explicit devm_add_action_or_reset() that would require less
> > memory, but would add some LoC.
> >
>
> or leave it as-is, of course ;-)
>
> >
> > See https://elixir.bootlin.com/linux/v6.13-rc3/source/drivers/base/
> > devres.c#L97
> >

The precise size does not matter in this case, 4096 was picked semi-arbitrarily
as a "nice-looking" number that is definitely bigger than the maximum
message size.
