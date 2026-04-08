Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433FE377003
	for <asahi@lists.linux.dev>; Wed,  8 Apr 2026 13:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775656653; cv=none; b=rIfveLTtA038W1ZZ0pHbpzsyUNheS5ug1Oc7wZP1MpS00J8tlkMMT02/V6MTCrG136PnYGKYtiiOQFx+U7KQM/0rPzpTO0Yyv67fdLIFSSkZvaUz3dd7HPVAkOFukY9JYljJ2Poi8NE1nHmPholEyURJDxjXImlEUGLl5zfZyjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775656653; c=relaxed/simple;
	bh=iVzYktDqQoVsac4V0l0TREA1TCgxcBM7qkRKmohyM/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EjWw1ouJxMP/zD6kuXNBGI9/MEcOq0q3oti9N7oDHuatbOnRjMUGOcua3BJN7jp0Qeb4uPrtzGZVWfm/+NyLzjKesXa1iuId0pOsmcS+NmFI7ZuSAcmzvbYaRTweBNbgOBlpth5NY9OJKoLHELy7BQMaF3aIGttOkS7FfYUa9Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=EmlW33VM; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="EmlW33VM"
Received: from localhost (unknown [10.10.165.28])
	by mail.ispras.ru (Postfix) with ESMTPSA id 6458F45F7982;
	Wed,  8 Apr 2026 13:57:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 6458F45F7982
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1775656641;
	bh=qJ14xyneL5A9/L/KrHb5BAjljVMrFlgO0kngOi7YGhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EmlW33VMXV1fxuMduQyfKd1YopPc90ric6gVZtN8/MtzyTmT7hA/12yHEKyW1oLlX
	 Rm/fW5KNwOotqi06xyokYUUgPvmrbux3uR0Fn4rPVOyeT5DnOezrLCrc+00EeTI9JC
	 m+75ccAjcoRNXJFQoVV4IwxZmYPhn0I4pBdPPMTE=
Date: Wed, 8 Apr 2026 16:57:21 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Jens Axboe <axboe@kernel.dk>
Cc: Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@suse.de>, Ming Lei <ming.lei@redhat.com>, 
	Chaitanya Kulkarni <kch@nvidia.com>, "Heyne, Maximilian" <mheyne@amazon.de>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
	lvc-project@linuxtesting.org, stable@vger.kernel.org
Subject: Re: [PATCH] nvme-apple: drop invalid put of admin queue reference
 count
Message-ID: <20260408165531-2a55fd1a87a2369d9a5bea2b-pchelkin@ispras>
References: <20260403202701.991276-1-pchelkin@ispras.ru>
 <8143e057-4c3b-4365-8780-003e897b9baf@kernel.dk>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8143e057-4c3b-4365-8780-003e897b9baf@kernel.dk>

On Mon, 06. Apr 20:20, Jens Axboe wrote:
> On 4/3/26 2:27 PM, Fedor Pchelkin wrote:
> > @@ -1269,8 +1269,6 @@ static void apple_nvme_free_ctrl(struct nvme_ctrl *ctrl)
> >  {
> >  	struct apple_nvme *anv = ctrl_to_apple_nvme(ctrl);
> >  
> > -	if (anv->ctrl.admin_q)
> > -		blk_put_queue(anv->ctrl.admin_q);
> >  	put_device(anv->dev);
> >  }
> 
> Could this just be:
> 
> static void apple_nvme_free_ctrl(struct nvme_ctrl *ctrl)
> {
> 	put_device(ctrl->dev);
> }
> 
> at this point?

Right, ctrl->dev and anv->dev point to the same device.  I'll simplify in v2.
