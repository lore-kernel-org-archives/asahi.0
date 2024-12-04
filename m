Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B9519DF66
	for <asahi@lists.linux.dev>; Wed,  4 Dec 2024 09:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733304542; cv=none; b=Mx0BvYVwsqqQyJYjY5cWn9bFDDJw9NKHYgag7NG9QQideih0eGM97XqjaMP54Ug3FoLGNUG2BhxUX7kcXU/ysaTsUOKaRPqtaXcVu2opejjXX0Wz6Palhzrq6gDQp/CUWzOvIE5Tq+5u3Pmkk7//mDJlhsnU21Sd8jGGnrsvTHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733304542; c=relaxed/simple;
	bh=ueBFVBbNKfTAft/cYLpMvLh9qEuyzUvOzL0BfZofqKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S3o/DujPggxnDUoeBoaE8I8wXr06hSMsoaZJavduey/hjqs7TjBkybYrIeBK5+MiTaZWQUKaM3x497oDjyXfd+q/qNl7/RD0w2NL9kd1EBZvGDGmwQ9/53RcpP3qc0CTriQdiS9oEM2rkKhvLrHSCCo3KULVtO7QpRE98+MXn5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jckqqt2l; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jckqqt2l"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e396c98af45so5902076276.1
        for <asahi@lists.linux.dev>; Wed, 04 Dec 2024 01:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733304539; x=1733909339; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pHrIZaLEeFmzu5KQ0LKYc7lzyVxc78OLSyYQ7PV95dk=;
        b=Jckqqt2leZthqj9Fr0NW16fkvjp2q4PSRZvXSRCE+v83IuadANx1MrFZRajr4UFti4
         C/CQHhGIJqrCpJeAr0lahW0BICnoAWilMc5gDyweYDbC5+jZbXefZYMshpx+MAc3VfJl
         hpR33D9MkUX7YIET2W6WVX1HEnlyHsPuVns1bK32ZGxLx+f90TmhqZZ3BT4bAz/MwF6G
         7mN3IZvjql4oGcUBjMgf1vKl1zXCj/1mhwR2nzfJqY/f/OEVgruJ4EDZyKGR3r1vXA7N
         wqj9QF4slaist9/rylErHGzcxn5MI1DHTRghjZcUvJdUZxuHW8nWIYFy8BBvHSF30V/2
         N4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733304539; x=1733909339;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pHrIZaLEeFmzu5KQ0LKYc7lzyVxc78OLSyYQ7PV95dk=;
        b=lX/2a4D6/J33dJhFDp2lJdZfS05FDods468CdpfaWYIRai+KG+O2A7GvscMBaSysY7
         MorNTUzF2GNRJSp4/gdcBh9ftl+qLIE6tj4Gh9ZWqL5/ohoDXYs7TSRs2Pvale0ruEFW
         N4QkONe0ViU4Z9mCuEJgZBaemEyeY7whU9Pgn6LyyEgHMjC/gqBVErWa7cn5lh8PbxNd
         ds7zMz6ymG1Wid/wZrnzNuF3qWOCP/E0ug3+5JbcixDvu2yZDFPKE+DV9kZFWN6UqrtS
         gUMbUA+s3cEsQA4sanj1MVTjAjx2Edn0miItWy6sD77nWDDC2zGn8LtJ9hqbRr0y6M5b
         NqcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxsb5DD6MxFFu+Zct01GImWNNroMVfFjvN8iNcSYCh2WNswjbpiji1bvl0uTm0kowoCZvWRA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGZj8Kd4v6/4ispQqErkPXAFr2N8Y5aedT6mRH48KOBfYWetv5
	vhoGyaoA7hQrmBT9u33NK2xsyDxE4pFAF7NLqE91F5qXpqX2glHGvxJ0mhwHOcuQCmF3O1spg19
	/i6dmIfc3nvmk60xn8PJZ9zEQtsA=
X-Gm-Gg: ASbGncubjQkHx/3q5x8l6NoKdSvnJUfRBoCnAm2MG85y3UIQiITJfLAexXRPJA3E701
	y56XUbvkKFz14jrIVoE6CHEnz00fnOFHX
X-Google-Smtp-Source: AGHT+IHmiUq5JaZBzDl7/VKOgdhADM9Ii0ineCplj6K99/74ASpMyAFGBPqR+m4ORzqcODkAuKrJN0c0KPHOQNpBbMg=
X-Received: by 2002:a05:6902:2d91:b0:e30:cea9:b071 with SMTP id
 3f1490d57ef6-e39d3e20f00mr4260700276.29.1733304539556; Wed, 04 Dec 2024
 01:28:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241128-z2-v2-0-76cc59bbf117@gmail.com> <20241128-z2-v2-2-76cc59bbf117@gmail.com>
 <Z0-PRapfiAUGvr4W@google.com>
In-Reply-To: <Z0-PRapfiAUGvr4W@google.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 4 Dec 2024 10:28:48 +0100
Message-ID: <CAMT+MTQ3M1gfz5aLWd17R-RODJi-wnxKJvf9zoX+TjoZMKjCKA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] input: apple_z2: Add a driver for Apple Z2 touchscreens
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Dec 2024 at 00:07, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > +     z2->counter = 1 - z2->counter;
>
> Is this toggling between 1 and 0? Should it be "counter = !counter"? And
> is there better name than counter?

message_index_parity? Kind of a mouthful.

> > +     .remove   = apple_z2_shutdown,
>
> Purring the device into reset state before tearing down interrupt
> handler, etc, may lead to weird errors. Why do you need to do this on
> removal instead of letting devm tear down the device?

The interrupt is masked before putting the device into reset,
and i do need to put it into reset when removing it.
