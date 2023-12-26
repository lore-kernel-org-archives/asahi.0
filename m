Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1C7524AE
	for <asahi@lists.linux.dev>; Tue, 26 Dec 2023 18:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="dTErSDMk"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4277e7146abso43076591cf.1
        for <asahi@lists.linux.dev>; Tue, 26 Dec 2023 10:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1703615053; x=1704219853; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbpck61YwtlHFMw5U/Lo3wdHWoHYEKh8KkvQ9gudgQY=;
        b=dTErSDMkc4zNsCT4Bxht+gcDzqR1hRQNsl6frwsirvwR5ZNR5Qh/qqVth+Vmk5dRjc
         lQOfuxSyGHPWPuXbw+nRnz91poQNHQIVfw7LWDO2TQaOXkGnLJoDDtttkC+4ASyKtb51
         t+XLTuomce9dJRt+Da22ovd8311eaJCe06YFCWc/XfeiJCE7fFzoadkP9cYHejoNK0GW
         7Siba0vkiCQ/NecbzNFU6KjR2YBa6bme0SdxFvfsAUfNE4r6QP4h1t5+LfU4LzvZMThe
         ktTjQXi5OCymzxnt1A3UZaMXW6Sq+9PQ5Awd7Jd9qRtmTYXmDyJKUMSL1SyK8mmruz7L
         AVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703615053; x=1704219853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nbpck61YwtlHFMw5U/Lo3wdHWoHYEKh8KkvQ9gudgQY=;
        b=HReI6ZmuA0Gn3gSQzIbRM2TViy+wlXa18tN93JA8FAa5hU/5QtqY5hOpwZK83t1+n8
         r6sVPqrZiS3+lLphRsFVbNZ3tItYwKGy4RrC8S3gzGnCOLvdKuSPfRRy4QxAlSabxU2/
         F28ciGz+jdf7JUhu4YIh2maGfLsqtDgiaC0dA+f+NYK7yn3iN0vuFL+aSLzdR38zKoqR
         bm7YFYbgtIzaXPRrounXDsHPL02HoNHTZf9AoCL3vVGnIVETSzkrjULNq5Zl5ahsoK/K
         pa7CARPCJDH2fIc/mVgu1OvySMJzn9fjlbQLG47hTO+fM0oFlvVQfXPSU9cFl5ZVr/Pq
         FVUQ==
X-Gm-Message-State: AOJu0Yy3YHWzaxnkuh7sNAAoxqkB+qxDWzWQfuNmKH71tfBSx7HYYn7R
	4eaSPLr0+1qPlShhkh+ulNSCODHvjF3lXnEnJZWOxADs0wH+2g==
X-Google-Smtp-Source: AGHT+IFWmjNlQw3TJVBvqU22wp4AVqBkS4XAMC4VqHZ635t1MVhw4Y6RPWn1r1oeRtxRwF8xQLfAKRRH1Aun3pHsf+k=
X-Received: by 2002:a05:622a:307:b0:427:7c4f:9d1a with SMTP id
 q7-20020a05622a030700b004277c4f9d1amr12102912qtw.31.1703615053674; Tue, 26
 Dec 2023 10:24:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231128204938.1453583-1-pasha.tatashin@soleen.com>
 <20231128204938.1453583-16-pasha.tatashin@soleen.com> <20231225110930-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231225110930-mutt-send-email-mst@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 26 Dec 2023 13:23:37 -0500
Message-ID: <CA+CK2bCTVqgW2uuSi7WqwGKkd7GT+QoSad2zkNun74wVV_J0Yw@mail.gmail.com>
Subject: Re: [PATCH 15/16] vhost-vdpa: account iommu allocations
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: akpm@linux-foundation.org, alex.williamson@redhat.com, 
	alim.akhtar@samsung.com, alyssa@rosenzweig.io, asahi@lists.linux.dev, 
	baolu.lu@linux.intel.com, bhelgaas@google.com, cgroups@vger.kernel.org, 
	corbet@lwn.net, david@redhat.com, dwmw2@infradead.org, hannes@cmpxchg.org, 
	heiko@sntech.de, iommu@lists.linux.dev, jasowang@redhat.com, 
	jernej.skrabec@gmail.com, jgg@ziepe.ca, jonathanh@nvidia.com, joro@8bytes.org, 
	kevin.tian@intel.com, krzysztof.kozlowski@linaro.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, lizefan.x@bytedance.com, marcan@marcan.st, 
	mhiramat@kernel.org, m.szyprowski@samsung.com, netdev@vger.kernel.org, 
	paulmck@kernel.org, rdunlap@infradead.org, robin.murphy@arm.com, 
	samuel@sholland.org, suravee.suthikulpanit@amd.com, sven@svenpeter.dev, 
	thierry.reding@gmail.com, tj@kernel.org, tomas.mudrunka@gmail.com, 
	vdumpa@nvidia.com, virtualization@lists.linux.dev, wens@csie.org, 
	will@kernel.org, yu-cheng.yu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 25, 2023 at 11:09=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com=
> wrote:
>
> On Tue, Nov 28, 2023 at 08:49:37PM +0000, Pasha Tatashin wrote:
> > iommu allocations should be accounted in order to allow admins to
> > monitor and limit the amount of iommu memory.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>

Thank you,
Pasha
