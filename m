Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A21C213253
	for <asahi@lists.linux.dev>; Tue, 25 Feb 2025 21:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740520760; cv=none; b=fSVQH+dfpqWKS8yuXlU7MRR2HcyeCdx27zdDbTYEHQV+SxC7S+R2ylvAD1K2gkb1vJTQyF9crPlpziwK1p0Ady7fXESiUXmARDUNYM1jla1fddZCiBmapowwqDIxac4b3iIVOY7A/3n6Yrn7g5hbDnRRQlV4pTNvlnwvLkho6qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740520760; c=relaxed/simple;
	bh=lhlRVTyXQdUVVfNqKiQrllxx1N3vzrAL5haFxdHIUL8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vDglES39QcJ8YkSirmJUuNswElA7y9O/ba81J9FmRzW8G+qUVjluWEaWUoK4VOPaGr1oHB3gjGvQzt7UoK14vbWvhIYS0G8mCV3L0ruQSNJ2UQ6+eOfU5u8r9m339daS2e78ZW0X97OksfwwWa/8EyKrgTvGqwj7y43oJzjvEO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=YjIPVnKf; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="YjIPVnKf"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c0a4b030f2so794795185a.0
        for <asahi@lists.linux.dev>; Tue, 25 Feb 2025 13:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1740520757; x=1741125557; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lhlRVTyXQdUVVfNqKiQrllxx1N3vzrAL5haFxdHIUL8=;
        b=YjIPVnKfbGncfW9z4O8jpRa3bfm/1Czy70F78PwpKViNGYeIRYYKihjEctCiAd6aG7
         ARoM2iit3tc2H5fy60Z/nMgkNPoqjiuJyzFXv8f0/3k/zC+MoYGuJXIqlwfCnqv9hqAv
         FyDfVgCEu7VgLtYcS/kCeTO5x8wJ+ZJ0AsmvWNTuYjVdQ55MQ8c5IgIUHeufWRPHJ6zz
         WbEuOF35kf5PHFFK+jYcwL19FKvB9YVe+AqVZ0DmRriMo3a35LbTH+VNNqxqOkyfvKmG
         9rKW5+cSjOqNoPqOVd9mdTwvvw7YQliEvQs8pCD/OR+Pl0+kjZjvP/mo6TRcXFdOrkp8
         38QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740520757; x=1741125557;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lhlRVTyXQdUVVfNqKiQrllxx1N3vzrAL5haFxdHIUL8=;
        b=DQeIBVdr7579rc8UiwzJFBN1NdkJ341SBTFB2feFFOCBmY89hq9h0F7WbeIW4KBd7i
         0tVPTsRJqVpSzkgm8JJc8u2kU+Kx0aggZu+3ERz/GTLlezMQWKbKKN5Q+0z5YWfo1J0+
         2rI9QX2vqRnn13L+hUudViQlPCbo0omp7gDirDHXUSMXZ/LsYaQtSNq3K9SxRWPURjJx
         sJ6dg3AnUUVekggrC81+8ohVZmdKlGf1pLW5BGt7BEoo327DT2UDeRYojihUqXQb6D6e
         OeFLWcZbSZiChMKci/ybdENfySEn8/7QikT9AKkEtvaocfsspvhkFteNwdmsk/uB5Sag
         IVqw==
X-Forwarded-Encrypted: i=1; AJvYcCWUFiXtpZQtmb/i8cOYyvvN8kNncY6HvRYso+4tNzkLr0C0flgTwNqtkahp9XNIASUZm5ZnEQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzpp3Wys3WH+iA/VCcsex+LiJKROpPA0fmrKoxDCFJiT+f+5ANR
	3fV5BJwESgWVJkGPJGZnrRISLz51T1+OvOWfPtKggWFbHoN0iqR3h4joiA9FbyO9MD4DuLB1ek6
	O7HUCRWujTY+k3pkBjZPGCpBPXT2sB1rdPX/muRqqiHor7yQ9
X-Gm-Gg: ASbGncvJ1uIjaK2d8u9rW8hpuFf297bKv4T5TYRCdbQaLB9MO7uRzuuVARlVuXfMEcz
	xP3YZ5WIbHomGpvMXRCOmrLk+usfeN58Ld4EUPcAWh8HMn5AP2QE1ueUsEvhAgi1HYHII19olQa
	1hV8mqfw==
X-Google-Smtp-Source: AGHT+IHayo9PtL6kjpIMX2v8YKQ15rB6H8J82Goph6no5zjxnEkePH22x+kK7BRT9XWlzl9eTGw2l4h92HsV0xvaCj8=
X-Received: by 2002:a05:620a:4883:b0:7c0:c7aa:d829 with SMTP id
 af79cd13be357-7c0cf9504a2mr2399399285a.42.1740520757416; Tue, 25 Feb 2025
 13:59:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250225-apple-twiddled-modifiers-v2-1-cf69729e87f6@rosenzweig.io>
In-Reply-To: <20250225-apple-twiddled-modifiers-v2-1-cf69729e87f6@rosenzweig.io>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 25 Feb 2025 21:59:06 +0000
X-Gm-Features: AWEUYZmTADfb83tXUekSIDeFibRB5L8olGgSSUtW8nnT-NuSQ4JhGFcoTWxAp7E
Message-ID: <CAPj87rO3N2=3mNQg8-CUF=-XTysJHLmgArRKuvDpdk3YZ2xMvQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm: add modifiers for Apple GPU layouts
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 25 Feb 2025 at 21:35, Alyssa Rosenzweig <alyssa@rosenzweig.io> wrote:
> These layouts are notably not used for interchange across hardware
> blocks (e.g. with the display controller). There are other layouts for
> that but we don't support them either in userspace or kernelspace yet
> (even downstream), so we don't add modifiers here.

Yeah, when those have users with good definitions matching these, we
can add them here, even if they are downstream. Anything the GPU would
share out of context, or the codec, would be good for this.

> +/*
> + * Apple GPU-tiled layout.
> + *
> + * GPU-tiled images are divided into tiles. Tiles are always 16KiB, with
> + * dimensions depending on the base-format. Within a tile, pixels are fully
> + * interleaved (Morton order). Tiles themselves are raster-order.
> + *
> + * Images must be 16-byte aligned.
> + *
> + * For more information see
> + * https://docs.mesa3d.org/drivers/asahi.html#image-layouts

This writeup is really nice. I would prefer it was inlined here though
(similar to AFBC), with Mesa then referring to the kernel, but tbf
Vivante does have a similar external reference.

The one thing it's missing is an explicit description of how stride is
computed and used. I can see the 'obvious' way to do it for this and
compression, but it would be good to make it explicit, given some
misadventures in the past. CCS is probably the gold standard to refer
to here.

I'd be very happy to merge it with that.

Cheers,
Daniel
