Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046E6748D
	for <asahi@lists.linux.dev>; Thu,  2 Nov 2023 11:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1qyVji-0004ID-84; Thu, 02 Nov 2023 12:19:42 +0100
Message-ID: <18a77f80e2dfed630d22b9d6246c7d2122629a5a.camel@pengutronix.de>
Subject: Re: [PATCH 2/3] drm/scheduler: Fix UAF in
 drm_sched_fence_get_timeline_name
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Daniel
	Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Cc: asahi@lists.linux.dev, Asahi Lina <lina@asahilina.net>, Luben Tuikov
	 <ltuikov89@gmail.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, alyssa@rosenzweig.io, Sumit Semwal
	 <sumit.semwal@linaro.org>, Faith Ekstrand <faith.ekstrand@collabora.com>, 
	linux-media@vger.kernel.org
Date: Thu, 02 Nov 2023 12:19:40 +0100
In-Reply-To: <5438c132-e127-4456-9551-42c76fb521dd@amd.com>
References: <9c0cff84-45b1-268f-bdad-38c16316dbc3@amd.com>
	 <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
	 <20230714-drm-sched-fixes-v1-2-c567249709f7@asahilina.net>
	 <bef7ef62-3cd9-6ceb-5eb4-5ae0c0236778@amd.com>
	 <de502b41-2864-db1e-16a0-8a5d5e0e4ad3@asahilina.net>
	 <d9dc2fd5-d054-dbf3-72b7-fe9deaa46350@amd.com>
	 <236422117088ca854a6717114de73d99b2b9ba2f@rosenzweig.io>
	 <a42bd218-6eb5-6ddb-bbb4-d25118c59f40@amd.com>
	 <7b564e55-a9b7-0585-3cf1-d1f132f9a918@asahilina.net>
	 <daf48d76-ceee-c82d-a63a-e8e7770a9d83@amd.com>
	 <f5de10fa-57d6-a3d0-1cf9-084491aa6025@asahilina.net>
	 <200e9d74-7191-b1ed-e5f3-775827550853@amd.com>
	 <CAPM=9txcC9+ZePA5onJxtQr+nBe8UcA3_Kp5Da3zjKL7ZB4JPQ@mail.gmail.com>
	 <CAKMK7uG0G02ierkgAmJE1gfLto08LK5twGUEX1qN+qk9-AavYA@mail.gmail.com>
	 <5438c132-e127-4456-9551-42c76fb521dd@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: asahi@lists.linux.dev

Am Donnerstag, dem 02.11.2023 um 11:48 +0100 schrieb Christian K=C3=B6nig:
[...]
> I was considering to change the dma_fence semantics so that=20
> dma_fence_signal() could only be called from the interrupt contexts of=
=20
> devices and then put a big fat WARN_ON(!in_interrupt()) in there.
>=20
> It's a sledgehammer, but as far as I can see the only thing which might=
=20
> help. Opinions?

That's not going to fly. As soon as you are dealing with device drivers
that use IRQ threads, either voluntarily or even involuntarily on RT
kernels, the dma_fence_signal will be from process context.

Regards,
Lucas
