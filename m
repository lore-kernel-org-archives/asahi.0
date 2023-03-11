Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6AC7B
	for <asahi@lists.linux.dev>; Sat, 11 Mar 2023 19:45:52 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id er25so5620761edb.5
        for <asahi@lists.linux.dev>; Sat, 11 Mar 2023 11:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678563950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zLCrQdyTnukTKt1Qc5hOUjsel2piCYiG6rXSPOyBxA=;
        b=kPlMtAaUgh8VRT077EHQqqXZp6AZu73vAaGQBT6ZYTPP1rcw7BRwZ9nrphosgEXV1+
         mQdKdVK/+3MmY/6k2dtZaF8cd+A+J7JvQ0U5xxz5wjGdq7uj/1IHWNXEcLbCn6KJVBpT
         kxSb+4f0ajGMiYarehtQQP5AA4P5pQQ5ORsAfWog+eadFrrtLSRKkD0vWf49UImvMjij
         GR7oMjIKpXhRZao4eurFmdi3hlboFm2Vv+/JLhOo15eL7D5WPa1syGCwzEPiZXTa717Z
         HNNnzxx21/cmVLfXNDEV6BbpOcuGydcr6J/JGU+QgdG+MSFIvVRjnDJ/46vIebz+aq/x
         3yUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678563950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zLCrQdyTnukTKt1Qc5hOUjsel2piCYiG6rXSPOyBxA=;
        b=AOHca7NyrNbLxeZl1yvqTeNUft3dBZBC2Rhqa2wzKoyStj3kkbnuDnMOCtkncozSdo
         TqioQ9WmJlqFn9TJAIR7SJrv9ngkD+4AvUjFb6dfD6PQ3Kc5mXJFWZAbApehEEiJkOP4
         I8x5PlKQfVy3Nw/fSIXluGApTzon+VnvFt4mu/PyfiIFFaTjY2LralkjOm/kS1j/X0XC
         uOKXLgY17o4zlNQcv/RpA1aldSZ0G9XDKwoiA4BlP7zcqD4DTpXDnGzaJtqkXY9yOcVp
         3LNMTt+2g7CXrJt1wiby5tKyjx/fsYD8yLpw/XeDu/Wh01fAshXFrdSC5tlujOvtxXVP
         mGGQ==
X-Gm-Message-State: AO0yUKWdckCDOiEUp0FLTuSQmrMcaLFYGIEDTlSrAfmHtTQ1XRXjdzNT
	+JhAwbEK8VLlyxz/koRQ3j/t31tsQPemaa8wX+I=
X-Google-Smtp-Source: AK7set/GW4H9oVLyNF+MiokqtN3HHY5yUtJrDVEAVKHOWqYYLtObanyZW07sw7ehQIyDHn1O4BaXc+FDezJRVtIsreE=
X-Received: by 2002:a17:906:7cc6:b0:8b1:7682:3181 with SMTP id
 h6-20020a1709067cc600b008b176823181mr6185665ejp.9.1678563950540; Sat, 11 Mar
 2023 11:45:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230214-fpwm-v9-0-364480b0e4bd@gmail.com> <20230311194254.lydmh23has2e3flj@pengutronix.de>
In-Reply-To: <20230311194254.lydmh23has2e3flj@pengutronix.de>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Sat, 11 Mar 2023 20:45:39 +0100
Message-ID: <CAMT+MTRgL2_nVHZapqeFPchY9vnVWKE651DHY3Prq10eaU1EKQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/5] Hi,
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, - <asahi@lists.linux.dev>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Sasha Finkelstein <7d578vix8hzw@opayq.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 11 Mar 2023 at 20:43, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> apart from the subject this series is the same as the one sent slightly
> later.
That is correct, i screwed up the editing of the cover letter and caught it=
 only
after sending it. Please disregard this series and use the one sent later.
