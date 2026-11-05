Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793856182;
	b=TWkoN+ODfopEsnxmV9+SVE8pnILzt5WgivXzOJX4hCwHetcGB//a3thoAAYuBL8vfOsP
	 gsTkuBa3noTxvMwvgl9cq4YBzT7X1jCoph3o7FPuX/oMJENdIOc89Z3GvP6IY5sR9uvOb
	 mt2Hyecf3w0BPqSWedHP9jc+U8jtswvpNnpiIJCG3RDVfsn2579WFyry60hA+/bpPsffB
	 DOWf7VsYebipntpUgu5bqfUnjO7uu1RoHtuzHr0jLC6joH824RikE6T0VdSPcShGqWvf9
	 PbiY4Z/4wf2a73XZk5o7qjuNlmYv3o9odPGuapAAxI0Ev/FxbGOFCYaK28GgtlgCdvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793856182;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=rQr7yvtDdjv+uqRleV0ogoSLK/6tS11R1tEZLnAV5R0=;
	b=gE4soJeW2DKNgablRxK0SFRu1lJOOS5bQaElrWrgyFmPbgDJ8Al5MJBKv1heOeCOO3jj
	 aBfim+/bowBs0foe6ZMdITQ8kcsQROqn34YqkeDJInmZYKPipLrwMRqVc9CK0K5GWb2UA
	 vb4oDzF3jtiHoqeIwvX6I7Uq5SrTzK/khvl/X56+N6gyzkJzndKqzDj/MbIWLbj5fSRKF
	 6Edvd8HWy6wiUun7cDyJnNOopimVHo/763sq/FevnEQiNneW0ksUPkPzK/M4tTh4Dx6Yj
	 i9pT+7i8iJ5Qcdly3gm81FqaMH1nNsaOO3NxJxmjHUArt501BpK3r31aO1WbSynCyiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l1zqNp6g;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5780606A326;
	Thu,  5 Nov 2026 05:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5780606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l1zqNp6g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793856180; x=1825392180;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q0/e6ShWRmdK7g8M5BxZX/k/BD9zq62vEtWX/MYfK5Q=;
  b=l1zqNp6gdfoS+W1127Z7NnWzKSZfEfBk39TQOcI2n3dYmt0M4t5AJWvK
   Brm+fo8+buS1Kp5sKJWN4KgTqqCdXslERrlYOwanJ1YfZjUnGe2J+IRP5
   l3yIBiYWnQvqm/mGUN10iRvL6r8vPIx6I8v1xisJbauuHJGx670upmnbb
   Nu3VFpPFYzQhGGgXqoQlFbSn8bfWlYUNOHGVWTApDhr+wwykUe8Pb73Ov
   shlifWjsVanDb5y771OnSEXdHB49LWpsExci21QRHwGBL9mymgdVwtNgD
   Ux3fvOYaJupLv+5kDMx69LqjfV8hIqLWSF9DEXDnFL3TvZoI6/uTst/5O
   w==;
X-CSE-ConnectionGUID: ZNm8ZhfzTXGCu5S5Fczvbw==
X-CSE-MsgGUID: YB2qpvNnSV6f5ODusYD3gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2519748"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2519748"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 21:22:59 -0800
X-CSE-ConnectionGUID: WpFMwuZUQIiAaXokdmgZEw==
X-CSE-MsgGUID: 5dMSsW/sRGu3mh6f50Anhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7254379"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Nov 2026 21:22:55 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOpw4-00000000lih-2CSt;
	Thu, 05 Nov 2026 05:22:52 +0000
Date: Thu, 5 Nov 2026 13:22:43 +0800
From: kernel test robot <lkp@intel.com>
To: Andre Eikmeyer <dev@deq.rocks>, marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org, sven@kernel.org, j@jannau.net,
	neal@gompa.dev, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, 66ton99@gmail.com,
	josemiguelo.ochoa@gmail.com, aditya.garg@linux.dev,
	Andre Eikmeyer <dev@deq.rocks>,
	Yossef Osman <Yossef.Osman@proton.me>
Subject: Re: [PATCH 1/4] Bluetooth: btbcm: raise ACL priority on Apple
 Broadcom controllers
Message-ID: <202611051559.brx1v0og-lkp@intel.com>
References: <20261104151601.70493-2-dev@deq.rocks>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104151601.70493-2-dev@deq.rocks>

Hi Andre,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3f425f95ba3923d605f6a8b382e8fcdc59d479db]

url:    https://github.com/intel-lab-lkp/linux/commits/Andre-Eikmeyer/Bluetooth-btbcm-raise-ACL-priority-on-Apple-Broadcom-controllers/20261104-161558
base:   3f425f95ba3923d605f6a8b382e8fcdc59d479db
patch link:    https://lore.kernel.org/r/20261104151601.70493-2-dev%40deq.rocks
patch subject: [PATCH 1/4] Bluetooth: btbcm: raise ACL priority on Apple Broadcom controllers
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20261105/202611051559.brx1v0og-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611051559.brx1v0og-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611051559.brx1v0og-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/bluetooth/hci_bcm.c:152 struct member 'acl_priority' not described in 'bcm_device'
>> Warning: drivers/bluetooth/hci_bcm.c:152 struct member 'acl_priority' not described in 'bcm_device'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
