Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8466317F2
	for <asahi@lists.linux.dev>; Sat, 25 Feb 2023 07:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 891B1C433EF;
	Sat, 25 Feb 2023 07:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1677308428;
	bh=9DaSSSuAStTE38Q97iKS3CcvRFjMEQ5/vnkZFEYg3SE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XMIAM/1fyPQfueT7qOtYuSG9/ekWAAgoKyxKk0cHSFsnnExkLotQaSSZVn6wi36xm
	 I7cIbbDr2V+ErQKxLJ0FjdmczNomwBO0NFzEABqU9Djbqz6NDaihOmOZ7nn86q4v29
	 x1Brl1tRqx/PRc53Zn8Ku2C+AGmLqG6vHVCyagdY=
Date: Sat, 25 Feb 2023 08:00:24 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH 2/5] rust: device: Add a minimal RawDevice trait
Message-ID: <Y/myCFk7EBbh4I2a@kroah.com>
References: <20230224-rust-iopt-rtkit-v1-0-49ced3391295@asahilina.net>
 <20230224-rust-iopt-rtkit-v1-2-49ced3391295@asahilina.net>
 <Y/ieQ0UX/niAG1Hg@kroah.com>
 <ef3a3638-6381-87ab-d674-644306b6b6ce@asahilina.net>
 <Y/jFeZzZVCpBGvGv@kroah.com>
 <e6d6d928-4514-55b9-346d-2e5e82220729@arm.com>
 <Y/jYdTrsrCyCPXHT@kroah.com>
 <590134fc-a6fd-9d86-ba3f-c621332b65fc@arm.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <590134fc-a6fd-9d86-ba3f-c621332b65fc@arm.com>

On Fri, Feb 24, 2023 at 06:52:04PM +0000, Robin Murphy wrote:
> > But again, let's see about disconnecting the iommu ops entirely from the
> > device and just relying on the bus, that should work better, rigth?
> 
> Um, other way - iommu_ops have almost finished moving *off* the bus to be
> per-device. You acked the patch the other week and seemed pleased with it ;)

Oops, yes, sorry, I meant the other way around in my comment, see, it's
confusing :)

And yes, I want to see your patch series merged, it will make my "clean
up the driver core lifetime rules" work a lot easier, is it still
planned for 6.3-rc1?

> But either way that's orthogonal to this case, since the device that
> io-pgtable deals with cannot have iommu_ops of its own (it *is* the IOMMU,
> or at least a GPU MMU acting as one).

Agreed, and thanks for the detailed explaination, it makes more sense
now.  But I still think the pointer reference needs to be incremented
when saved off to be at least a bit more sane.

thanks,

greg k-h
