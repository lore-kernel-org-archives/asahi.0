Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73290225388
	for <asahi@lists.linux.dev>; Wed, 11 Jun 2025 19:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749668828; cv=none; b=nab7/VAH7mg/c1kDgk10+zai8hpqQTQ2y+/cakbkGZ4BRY93wOKOUzWfwtXB6ffc+Y6Dj+C8/XSHAUQ0MgWv6OBzhWh/gUmVdjWsevlDk0AwYdfVENhJsStYnmem2H0Yrr0nKPCLJxlPSftldJfpF59TIfoOi7eH8noL1GrUpwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749668828; c=relaxed/simple;
	bh=pdnpO1YxkWzXV5U9M40ePTBWbqEr3apcyjJa/6o3ZT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cOyEzD0TR+6lD818uHgdIsU3iJcxX8/QQCAERJ5WUeg0KjewSg3n5IyUu1RB+dcPau3wRgzRJKjhuN0du90/TS/dOXN4Qz1wFqwPKdg+DRgyjYlPjrcGSczsHP2ni86WLwbAtX1HULJVDA5YN3l2iRORoRkOcUGFu/iscFGU+aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTItf8Ia; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTItf8Ia"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e818a572828so114988276.1
        for <asahi@lists.linux.dev>; Wed, 11 Jun 2025 12:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749668826; x=1750273626; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1MF1dHTik4WYDT1dqFKnZOlAFt0Xaso+/EljV+ZdGk8=;
        b=dTItf8IaR5Fkl/CFUnlpKIyHOppMdD1zKi+yQsbsOCNEYZCC4KuRnr203QylHwLlCb
         3MpnP7RLjcC1OIomypX9NcxSqXpXgkq/OI+Kb48u1h1AM4bysdTKd8Q+NrCunKa4HpI6
         v22kM9wQEX4V8VydZFi4DXJIDVhw8awtOPiczVF6YKrgK+41BxASyJrhrFdxGZfrtWxI
         BKjNzjImRj22Ldg5nmRPhIqa/pk4uDHD06A2gDs3hn+Dym0/TXd7ErcdpGeCUfp//hKD
         qubPaLNxqwLXQ258JlN5wgkCWGN9yzbcQDjzi+bbUCLK7VtcZ4d49YK5GFsxr2Vk1Xp7
         8mOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749668826; x=1750273626;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1MF1dHTik4WYDT1dqFKnZOlAFt0Xaso+/EljV+ZdGk8=;
        b=mlxCIwErJBIwe0Xk44WevA/RdXfVM23UedmJjOpUJdSBgtzGOxUPR3P+HEWVN01ZUt
         QK7p5yKPdvkjGSbPNVnV9SQCNGSU1ZmgDhDMNQXisvTbBHlh6oILc1+4VC6yMeFv7+GJ
         qLqoYIlgTfVv1DlwC+iJVc+fyKUNXyO8ZWe70RsF3yfYqHJ2GYXWIhFFQiEYy4iX1Vg/
         AqXAADAJ577jywEQB5uRyttmWu6HA/8zehKrdc9xp29FmzFoex7oOwpL6GHe2NyW28Vk
         wt1/XxtDechKQRMMWTHto6OZhW9yvO4XZQLsdaZlXLNhT8YDZHsP1k5GvXt77o+YEuA3
         H8fw==
X-Gm-Message-State: AOJu0Yx463BoF1ZaUTlY4bZFellWkNaSoOiz7xYuGPKoMDvgxxVM8Zk2
	tov28d2f9ifSNqpnZ6tmHzmKJlqzH9ftNd8vRpyjmBRXiEAG12j7G3iXO6JqVeMb3o2MJwkb+zZ
	7qV7cy9lwnYNzYIIt1YLJAzegUWSSK/w=
X-Gm-Gg: ASbGncuh+jdEDbc6ssc+1LvYoHQLIr5XRj1P4dVoaarW9N4vELrkMEHoWEzuiiWXkqP
	mQyofAp+JuYb98TRSFU8gQr89uWSqBTo4FHwvBPU6m8uF/a81gSul2qdDDip0OlRQTdIuGScuL+
	fFszuGM9Haz2gQKZNdBo8ejQLFlWEfT/+RDLf+bq47bFXab4DjDq3mIII=
X-Google-Smtp-Source: AGHT+IFsZ3UIOk9VseJbWKxt8KvtKbfGOyN+aFYnhFj7EA+lzwyye2nE75imMRB1Spn6prKv90Mi/kjbFVIWTts4th0=
X-Received: by 2002:a05:6902:250b:b0:e81:99cd:9be with SMTP id
 3f1490d57ef6-e820b64d1a3mr1175425276.14.1749668826227; Wed, 11 Jun 2025
 12:07:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com> <20250611-sgx-dt-v1-1-7a11f3885c60@gmail.com>
 <edf14a64-decc-4392-a038-08b5dd942f8d@kernel.org>
In-Reply-To: <edf14a64-decc-4392-a038-08b5dd942f8d@kernel.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 11 Jun 2025 21:06:55 +0200
X-Gm-Features: AX0GCFvMeV5Ol-Irt1s6ubsKN_ZZGACBjoQJdDOoAp2hIzH0XLvrHdYRqZQPnT0
Message-ID: <CAMT+MTRYybR=tFJrcUn43UK3iW-fqEH3rmCLUezq2eTrEK=nQw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: Add Apple SoC GPU
To: Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Simona Vetter <simona@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Neal Gompa <neal@gompa.dev>, Maxime Ripard <mripard@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Jun 2025 at 20:44, Sven Peter <sven@kernel.org> wrote:
> > +      - description: Driver-opaque calibration blob
> > +      - description: Calibration blob
>
> Like Alyssa mentioned, this description also raises more questions than
> it answers for me. Do we know what these two blobs contain or why they
> are two separate blobs?

At some point in the gpu initialization process we give the firmware a bag
of pointers to various stuff it needs. HwCalA and HwCalB are separate
pointers, and they use separate gpu allocations. We do not fully know
what is in there, but we know what some of the fields do and how to
create the blobs based on data from apple device tree.
