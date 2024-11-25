Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02F61714AC
	for <asahi@lists.linux.dev>; Mon, 25 Nov 2024 13:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732540501; cv=none; b=naZObJTRc5yC1ceP541/m/k2ynV55ZnMDWIZwZeIUYf9u18QOUbc907+HSyKhW94/EWPoEzA1i4+PZARbfndrjmZShX8Yu0yjxjZcpW9xSwfJedv/0j0zxDThl5i9gtPxe9GgWy37TXHczm/Xuy12FvUBdLyazTdqEd3DJ/cSRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732540501; c=relaxed/simple;
	bh=29eqaOcblHE7fnrH+/9B8++CMwboxE8T+PhkUkEFlJM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fhUK8lb4J1erN6qPTKHkYbgD8TkAQvvKBP6n62ZlghzZrk5nX97b8YwL88apjaBckTjCXZ7/4P+X3R4rtFfBf0gSNcgd92cKqVbmlzOkYRcgF0nbuJT8RMvQfMbl6bZuVxqOjasSsRVHL8B0pelNlSAWncI7K5v995MZM/OgL5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=baHndzK9; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="baHndzK9"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e333af0f528so3903935276.3
        for <asahi@lists.linux.dev>; Mon, 25 Nov 2024 05:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732540499; x=1733145299; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=29eqaOcblHE7fnrH+/9B8++CMwboxE8T+PhkUkEFlJM=;
        b=baHndzK9BwDL2gTwCSlJeXtiUafucNPpW21kEa0SDJbcdWBGPOsuG5NZcH51cC0eD7
         M0CUXAgsmmyiRtWe2r1u7wUfaQuQnIrfDFHDAenhVmkXIQ5UeKkVmiwRmQU67XsvABuz
         6k5Ma2lv0xvIbYVHW9SkjehBCpIgtQx7l0iwHDyOrWXpqUOa9EsVX3aFKY9wgYGH/n/2
         Ho/C9eyP7dRTActOTqhEgTLLV0GEriAOJh80tOg37FewSvczScytET8z+KOQE81+rMP6
         H2KutM6mair8sQBepEp67/S0UlOOnUj8G3PxgsEZRw8mVgTS0LQHF6CAVBjIBbxNOOeD
         aMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732540499; x=1733145299;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=29eqaOcblHE7fnrH+/9B8++CMwboxE8T+PhkUkEFlJM=;
        b=tlnB2ZKfKPNYYGloMChY9N0tdDTG2qSDzpaKTylkS2gvdYkkLPIOrL/HXiNWJDNQ9Q
         iAQPvO4wuiiN7kH2hQzKsf+sh32jlgk+8rCxYA0ykrNT/7jhjiEXhTVWWIagmL/esOPE
         Rx39sr5zms4nm3XVGG1lKMsfd0A4p45/8D7TyMEg1VJ9GLM0iyWcpY5hYsRw1eKIfwvO
         mXSqJS22OGlB5xLmbKQOev0WHFwvIPWx4cFk5Q+mT4yaSVE6+yD6rtMTXE0eTwCh+dLp
         kOPb6BOi3/h37uyjYUO6Jqd07C+qEB8bXJd2gvq2k0kTd2voUmsuACh5M9/3hpeG5ZWG
         zUXA==
X-Forwarded-Encrypted: i=1; AJvYcCWocyWPLN5G1KMZDba8nNn0rXn/UQqsytPhle0Hpwld7WFuborZfQ3FaH1NCn4IxBrlqB7EYw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxWUvCjC/6PBDFqkOxuY+5qp4MbqrMgDlHRlklaW7qEMkiDFSuD
	ayJ1Cd6/NQy+S0V32vAc02zCjljUliziEiM0W65pRbYoeIiRbEh8CPQ6SJHGVe864geKSX7uHlu
	bNzgDcB5NFVS1/ZQ9fzpoJ1+ETys=
X-Gm-Gg: ASbGncvMW46IeBjZEKuUbrQKunhvN3pM8Bm4+mfME4QZZ0sXDnC4Nmud/J2eTi3VUNL
	zX8SATBkSb/8aKw0NpYlBzQCENAjHnUyP
X-Google-Smtp-Source: AGHT+IGfaRNCO8ZfhjsTKNxOcvugz+C7g7ey2hBA5+ko6id9//Gtggy/7MbHGZufCHhEZf6fX8TjG/HrfvyCxyamoGU=
X-Received: by 2002:a05:6902:e0f:b0:e2b:d131:f293 with SMTP id
 3f1490d57ef6-e38f8c09892mr11476595276.51.1732540498735; Mon, 25 Nov 2024
 05:14:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com> <20241124-adpdrm-v1-2-3191d8e6e49a@gmail.com>
 <10d0aa88-de2e-4856-a137-301519e58b2d@linaro.org> <CAMT+MTRWZWj=3AP7wyooXr49-W4vcm0ZbAoqPyEuNkQBMOaJfw@mail.gmail.com>
 <c6b0273f-16f3-4469-a4b8-9564f7355400@linaro.org>
In-Reply-To: <c6b0273f-16f3-4469-a4b8-9564f7355400@linaro.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Mon, 25 Nov 2024 14:14:47 +0100
Message-ID: <CAMT+MTS3Nmy=RzsE4wUf=jHBsu8ghyyqpXWPyB8qoR+W3EUscw@mail.gmail.com>
Subject: Re: [PATCH 2/5] gpu: drm: adp: Add Apple Display Pipe driver
To: neil.armstrong@linaro.org
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Nov 2024 at 13:57, <neil.armstrong@linaro.org> wrote:
>
> On 25/11/2024 12:24, Sasha Finkelstein wrote:
> > On Mon, 25 Nov 2024 at 09:50, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> >>
> >> So this controller only supports a single mode ???????
> >>
> > Most likely. On all devices it is connected to a single built-in display.
> >
> > Ack on all other changes, will be fixed for v2.
>
> OK, so instead make the panel driver return this single mode
> and from the display driver just filter out anything that's
> not ADP_SCREEN_VSIZE & ADP_SCREEN_HSIZE.

Not sure i follow, you want the mode hardcoded in the panel driver
and the controller driver to fetch and return that?
